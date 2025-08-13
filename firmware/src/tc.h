/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 */


#ifndef _TC_H    /* Guard against multiple inclusion */
#define _TC_H

#ifdef __cplusplus
extern "C" {
#endif

#include "type_definitions.h"
    
#define TC0 ((volatile tc_registers*)(0x40003800))

#define TC1 ((volatile tc_registers*)(0x40003C00))

#define TC2 ((volatile tc_registers*)(0x4101A000))

#define TC3 ((volatile tc_registers*)(0x4101C000))

#define TC4 ((volatile tc_registers*)(0x42001400))

#define TC5 ((volatile tc_registers*)(0x42001800))

#define TC6 ((volatile tc_registers*)(0x43001400))

#define TC7 ((volatile tc_registers*)(0x43001800))

#define MFRQ        0x1
#define ENABLE      0x1
#define LUPD        0x1
#define CTRLB       0x2
#define MODE        0x2
#define STATUS_bit  0x3
#define CCBUFV0     0x4
#define CCBUFV0     0x4
#define OSC32K      0x4 //see page 151, Table 14-4.
#define CMD         0x5
#define EXOSC32K    0x5 //see page 151, Table 14-4.
#define CC0_bit     0x6
#define PRESCALER   0x8
#define PRESCSYNC   0x4
#define GCLK_TC0    0x9 //see page 154
#define DPLL0       0x7 //see page 151, Table 14-4.

typedef struct {
    uint8 COUNT;
    uint8 RESERVED[6];
    uint8 PER;
    uint8 CC0;
    uint8 CC1;
    uint8 RESERVED1[16];
    uint8 PERBUF;
    uint8 CCBUF0;
    uint8 CCBUF1;
} count8;

typedef struct {
    volatile uint16 COUNT;
    volatile uint8  RESERVED[6];
    volatile uint16 CC0;
    volatile uint16 CC1;
    volatile uint8  RESERVED1[16];
    volatile uint16 CCBUF0;
    volatile uint16 CCBUF1;
} count16;

typedef struct{
    volatile uint32 COUNT;
    volatile uint8  RESERVED[4];
    volatile uint32 CC0;
    volatile uint32 CC1;
    volatile uint8  RESERVED1[12];
    volatile uint32 CCBUF0;
    volatile uint32 CCBUF1;
} count32;

typedef struct {
    volatile uint32 CTRLA;
    volatile uint8  CTRLBCLR;
    volatile uint8  CTRLBSET;
    volatile uint16 EVCTRL;
    volatile uint8  INTENCLR;
    volatile uint8  INTENSET;
    volatile uint8  INTFLAG;
    volatile uint8  STATUS;
    volatile uint8  WAVE;
    volatile uint8  DRVCTRL;
    volatile uint8  RESERVED;
    volatile uint8  DBGCTRL;
    volatile uint32 SYNCBUSY;
    volatile union {
        volatile count8  COUNT8;
        volatile count16 COUNT16;
        volatile count32 COUNT32;
    };
} tc_registers;
    
void   tc_start_tcs(void);
uint8  tc_config_tcs();
void   tc_start(volatile tc_registers*);
uint8  tc_set_period_hw_update(volatile tc_registers*, uint16);
uint16 read_intflag(volatile tc_registers*);
uint16 read_ctrla(volatile tc_registers*);
uint16 read_cc0(volatile tc_registers*);
uint16 read_counter(volatile tc_registers*);
uint8  tc_config(volatile tc_registers*, uint32);
uint8  tc_set_period(volatile tc_registers*, uint16);
void   TC0_Handler(void);

#ifdef __cplusplus
}
#endif

#endif 
