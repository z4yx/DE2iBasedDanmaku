#ifndef PIN_DEF_H__
#define PIN_DEF_H__

#include "system.h"
#include "altera_avalon_pio_regs.h"

#define PIN_S_SCL (1<<0)
#define PIN_S_SDA (1<<1)
#define PIN_M_SCL (1<<2)
#define PIN_M_SDA (1<<3)
#define PIN_HPD   (1<<4)
#define PIN_SW_FORCE (1<<4)


//Input and Output uses different PIO!
#define READ_INPUT() IORD_ALTERA_AVALON_PIO_DATA(PIO_IN_BASE)
#define WRITE_OUTPUT(data) IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUT_BASE, (data))
#define READ_OUTPUT() IORD_ALTERA_AVALON_PIO_DATA(PIO_OUT_BASE)
#define SET_BITS(bits) WRITE_OUTPUT((bits) | READ_OUTPUT())
#define CLR_BITS(bits) WRITE_OUTPUT((~bits) & READ_OUTPUT())

#endif //PIN_DEF_H__
