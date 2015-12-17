/*
 * i2c_master.c
 *
 *  Created on: 2015-12-16
 *      Author: 305B
 */



#include "stdint_.h"
#include "pin_def.h"

//release pin
#define SDA_HIGH() CLR_BITS(PIN_M_SDA)
#define SCL_HIGH() CLR_BITS(PIN_M_SCL)
//pin drive low
#define SDA_LOW() SET_BITS(PIN_M_SDA)
#define SCL_LOW() SET_BITS(PIN_M_SCL)

#define SDA_IN()  ((READ_INPUT() & PIN_M_SDA)!=0)
#define SCL_IN()  ((READ_INPUT() & PIN_M_SCL)!=0)

void i2c_master_dly(void)
{
	usleep(5);
}

void i2c_master_start(void)
{
    SDA_HIGH();             // i2c start bit sequence
    i2c_master_dly();
    SCL_HIGH();
    i2c_master_dly();
    SDA_LOW();
    i2c_master_dly();
    SCL_LOW();
    i2c_master_dly();
}

void i2c_master_stop(void)
{
    SDA_LOW();             // i2c stop bit sequence
    i2c_master_dly();
    SCL_HIGH();
    i2c_master_dly();
    SDA_HIGH();
    i2c_master_dly();
}

unsigned char i2c_master_rx(char ack)
{
    char x, d = 0;
    SDA_HIGH();
    i2c_master_dly();
    for (x = 0; x < 8; x++) {
        d <<= 1;
        do {
            SCL_HIGH();
        } while (SCL_IN() == 0); // wait for any SCL clock stretching
        i2c_master_dly();
        if (SDA_IN()) d |= 1;
        SCL_LOW();
        i2c_master_dly();
    }

    if (ack) SDA_LOW();
    else SDA_HIGH();
    i2c_master_dly();
    SCL_HIGH();
    i2c_master_dly();             // send (N)ACK bit
    SCL_LOW();
    i2c_master_dly();
    SDA_HIGH();
    return d;
}

char i2c_master_tx(unsigned char d)
{
    char x;
    static char b;
    for (x = 8; x; x--) {
        if (d & 0x80) SDA_HIGH();
        else SDA_LOW();
        i2c_master_dly();
        SCL_HIGH();
        d <<= 1;
        i2c_master_dly();
        SCL_LOW();
    }
    SDA_HIGH();
    i2c_master_dly();
    SCL_HIGH();
    i2c_master_dly();
    b = SDA_IN();          // possible ACK bit
    SCL_LOW();
    return b;
}
