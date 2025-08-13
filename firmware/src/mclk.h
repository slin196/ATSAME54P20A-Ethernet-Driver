

#include "type_definitions.h"

#ifndef _MLCK_H    /* Guard against multiple inclusion */
#define _MLCK_H

#ifdef __cplusplus
extern "C" {
#endif

#define MCLK ((volatile mlck_registers*)(0x40000800))

typedef struct {
    uint8  RESERVED;
    uint8  INTENCLR;
    uint8  INTENSET;
    uint8  INTFLAG;
    uint8  HSDIV;
    uint8  CPUDIV;
    uint8  RESERVED1[10];
    uint32 AHBMASK;
    uint32 APBAMASK;
    uint32 APBBMASK;
    uint32 APBCMASK;
    uint32 APBDMASK;
} mlck_registers;

uint8 _mclk_enable_apba_peripheral(uintptr_t);
uint8 _mclk_enable_apbb_peripheral(uintptr_t);
uint8 _mclk_enable_apbc_peripheral(uintptr_t);
uint8 _mclk_enable_apbd_peripheral(uintptr_t);
uint8 mclk_enable_peripheral_clock(volatile void*);

#ifdef __cplusplus
}
#endif

#endif 

