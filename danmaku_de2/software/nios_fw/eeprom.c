/*
 * eeprom.c
 *
 *  Created on: 2015-12-16
 *      Author: 305B
 */

#include "stdio.h"
#include "stdint_.h"
#include "eeprom.h"

int read_eeprom(uint8_t* buf, int len, uint8_t addr8)
{
	i2c_master_start();
	//printf("-after start\n");
	if(0 != i2c_master_tx(addr8)){
		i2c_master_stop();
		return -1;
	}
	//printf("-after setup w\n");
	i2c_master_tx(0x00);
	//printf("-after tx\n");
	i2c_master_start();
	//printf("-after restart\n");
	i2c_master_tx(addr8 | 1);
	//printf("-after setup r\n");
	for(int i=0; i<len; i++){
		buf[i] = i2c_master_rx(i < len-1);
	}
	i2c_master_stop();
	//printf("-after stop\n");
	return len;
}
