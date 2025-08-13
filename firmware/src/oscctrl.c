


#include "type_definitions.h"
#include "oscctrl.h"


void oscctrl_start_xosc0(void) {
    OSCCTRL->XOSCCTRL0 |= (1<<ENABLE);
    while (!(OSCCTRL->STATUS & (1<<XOSCRDY0)));
}


