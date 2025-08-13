

#ifndef _OSCCTRL_H    /* Guard against multiple inclusion */
#define _OSCCTRL_H


#ifdef __cplusplus
extern "C" {
#endif

#define OSCCTRL ((volatile oscctrl_registers*)(0x40001000))
#define ENABLE                          1
#define XOSCRDY0                        0
#define XOSCRDY1                        1

typedef struct{
    uint8  EVCTRL;
    uint8  RESERVED[3];
    uint32 INTENCLR;
    uint32 INTENSET;
    uint32 INTFLAG;
    uint32 STATUS;
    uint32 XOSCCTRL0;
    uint32 XOSCCTRL1;
    uint8  DFLLCTRLA;
    uint8  RESERVED1[3];
    uint8  DFLLCTRLB;
    uint8  RESERVED2[3];
    uint32 DFLLMUL;
    uint32 DFLLSYNC;
    uint8  RESERVED3[3];
    uint8  DPLL0CTRLA;
    uint8  RESERVED4[3];
    uint32 DPLL0RATIO;
    uint32 DPLL0CTRLB;
    uint32 DPLL0SYNCBUSY;
    uint32 DPLL0STATUS;
    uint8  DPLL1CTRLA;
    uint8  RESERVED5[3];
    uint32 DPLL1RATIO;
    uint32 DPLL1CTRLB;
    uint32 DPLL1SYNCBUSY;
    uint32 DPLL1STATUS;
} oscctrl_registers;
    
void oscctrl_start_xosc0(void);
    
#ifdef __cplusplus
}
#endif

#endif