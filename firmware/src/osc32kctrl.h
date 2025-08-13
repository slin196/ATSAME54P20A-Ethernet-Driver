

#ifndef _OSC32KCTRL_H    /* Guard against multiple inclusion */
#define _OSC32KCTRL_H

#ifdef __cplusplus
extern "C" {
#endif

#include "type_definitions.h"

#define OSC32KCTRL ((volatile oscctrl_registers *)(0x40001400))


typedef struct {
    uint32 INTENCLR;
    uint32 INTENSET;
    uint32 INTFLAG;
    uint32 STATUS;
    uint8  RTCCTRL;
    uint8  RESERVED[3];
    uint16 XOSC32K;
    uint8  CFDCTRL;
    uint8  EVCTRL;
    uint8  RESERVED1[4];
    uint32 OSCULP32K;
} oscctrl_registers;
    
#ifdef __cplusplus
}
#endif

#endif
