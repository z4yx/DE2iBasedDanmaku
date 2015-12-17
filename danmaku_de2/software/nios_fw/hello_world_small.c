/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

#include "stdio.h"
#include "string.h"

#include "stdint_.h"
#include "eeprom.h"
#include "pin_def.h"

enum{STATE_NO_SCR, STATE_EDID_READ, STATE_EDID_READY, STATE_CONNECTED};

void hackEDID(uint8_t buf[128])
{
    const char ManufacturerName[3] = {'T', 'H', 'U'}; //only capital letters are allowed
    buf[0x8] = (ManufacturerName[0]-'A'+1)<<2 | (ManufacturerName[1]-'A'+1)>>3;
    buf[0x9] = (ManufacturerName[1]-'A'+1)<<5 | (ManufacturerName[2]-'A'+1);

    buf[0x10] = 50; //week of year
    buf[0x11] = (2015-1990); //year

    buf[0x14] = 0x80; //digital input !important

    for (int i = 0; i < 4; ++i)
    {
        int j = 0x36+i*18;
        if(!buf[j] && !buf[j+1] && !buf[j+2] && !buf[j+4]) { //block used as descriptor
            switch(buf[j+3]){
            case 0xfe: //ASCII String
                break;
            case 0xfc: //Monitor Name
                memcpy(&buf[j+5], "Danmaku 9\x0a   ", 13);
                break;
            }
        }
    }

    buf[0x7e] = 0; //No extension block

    uint8_t chksum = 0;
    for (int i = 0; i < 127; ++i)
    {
        chksum += buf[i];
    }
    buf[0x7f] = -chksum;
}
uint8_t verifyChecksum(uint8_t buf[128])
{
	uint8_t t = 0;
	if(buf[0]!=0 || buf[7]!=0)
		return 0;
	for(int i=1; i<7; i++)
		if(buf[i] != 0xff)
			return 0;
	for(int i=0; i<128; i++)
		t += buf[i];
	return t==0;
}

uint8_t edid[128];
int state = STATE_NO_SCR;

void updateEDIDMemory()
{
	uint8_t *ptr = AVALON_SLAVE_EDID_0_BASE;
	for(int i=0; i<128; i++){
		ptr[i] = edid[i];
	}

}

void switch_state(int newState)
{
	state = newState;
	printf("new state %d\n", newState);
}

int main()
{ 
	int ret;
	alt_putstr("Hello from Nios II!\n");

	CLR_BITS(PIN_HPD);
	switch_state(STATE_NO_SCR);

	/* Event loop never exits. */
	while (1){
		switch(state){
		case STATE_NO_SCR:

			ret = read_eeprom(edid, 128, 0xa0);
			if(ret < 0){
				usleep(50000);
			}else{
				printf("read_eeprom=%d\n", ret);
				ret = verifyChecksum(edid);
				printf("checksum=%d\n", ret);
				if(ret){
					switch_state(STATE_EDID_READ);
				}
			}
			break;

		case STATE_EDID_READ:
			hackEDID(edid);
			switch_state(STATE_EDID_READY);
			break;
		case STATE_EDID_READY:
			CLR_BITS(PIN_HPD);
			usleep(10000);
			updateEDIDMemory();
			printf("EDID updated\n");
			SET_BITS(PIN_HPD);
			switch_state(STATE_CONNECTED);
			break;
		case STATE_CONNECTED:
			usleep(200000);
			if(read_eeprom(edid, 128, 0xa0) == -1
					|| !verifyChecksum(edid)){
				CLR_BITS(PIN_HPD);
				printf("lost screen\n");
				switch_state(STATE_NO_SCR);
			}
			break;
		}
	}

    return 0;
}
