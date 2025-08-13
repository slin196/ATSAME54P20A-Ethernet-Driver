

#include "ethernet_functions.h"
#include "glck.h"

#define RTC ((volatile rtc_registers*) (0x40002400))


typedef struct {
    uint16 CTRLA;
    uint16 CTRLB;
    uint32 EVCTRL;
    uint16 INTENCLR;
    uint16 INTENSET;
    uint16 INTFLAG;
    uint8  DBGCTRL;
    uint8  RESERVED;
    uint32 SYNCBUSY;
    uint8  FREQCORR;
    uint8  RESERVED1[3];
    uint32 COUNT;
    uint32 RESERVED2;
    uint32 COMP0;
    uint32 COMP1;
    //TODO: implement remaining registers
} rtc_registers;


void set_period() {
            //set the period of the interrupt see page 285
}


void rtc_init(void) {
    // GCLK für RTC aktivieren (z.?B. GCLK1 = 1.024 kHz oder GCLK2 = 32.768 kHz)

    /*     21.6.2.1 Initialization
     The following bits are enable-protected, meaning that they can only be written when the RTC is
     disabled (CTRLA.ENABLE=0):*/
    RTC->CTRLA = 0;
    /*    
     ? Operating Mode bits in the Control A register (CTRLA.MODE)
     ? Prescaler bits in the Control A register (CTRLA.PRESCALER)
     ? Clear on Match bit in the Control A register (CTRLA.MATCHCLR)
     ? Clock Representation bit in the Control A register (CTRLA.CLKREP*/

}