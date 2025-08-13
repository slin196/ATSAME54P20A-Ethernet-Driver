/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 */


#include "type_definitions.h"
#include "oscctrl.h"
#include "peripherals.h"
#include "glck.h"
#include "port.h"

int _PCHCTRLm_MAPPING(volatile void * peripheral) {//TODO: void pointer ? finde noch heraus ob das schlechte praxis ist
    //see page 154/155,  Table 14-9
    uintptr_t per_addr = (uintptr_t) peripheral;
    int m = -1;
    switch(per_addr) {
        case 0x40003800:;               //TC0, see page 47
        case 0x40003C00: m = 9; break;  //TC1 and TC0, see pages 47, 154
        case 0x4101A000:;               //TC2, see page 47
        case 0x4101C000: m = 26; break; //TC3 and TC2, see pages 47, 154
        case 0x42001400:;               //TC4, see page 47
        case 0x42001800: m = 30; break; //TC5 and TC4, see pages 47, 154
        case 0x43001400:;               //TC6, see page 47
        case 0x43001800: m = 39; break;  //TC7 and TC6, see pages 47, 155
        //TODO: implement remaining peripheral mapping, see Table 14-9
    }
    return m;
}

uint8 glck_config(uint8 generator, volatile void* peripheral, uint32 clock_source) {//TODO funktionsparameter hinzufügen die es erlauben festzulegen welcher generator und peripheral channel wie 
    //konfiguriert werden soll, d.h. wie die DIVSEL und DIV bits gesetzt werden sollen
    int idx_m = _PCHCTRLm_MAPPING(peripheral);
    if (idx_m < 0) return OPERATION_FAILURE;
    /*Before a Generator is enabled, the corresponding clock source should be enabled. The Peripheral
     clock must be configured as outlined by the following steps:
     1. The Generator must be enabled (GENCTRLn.GENEN=1) and the division factor must be set
     (GENTRLn.DIVSEL and GENCTRLn.DIV) by performing a single 32-bit write to the Generator
     Control register (GENCTRLn).*/ //see page 141
    volatile uint32 gen_val = (1<<GENEN) | (0<<DIVSEL) | 1<<DIV | clock_source;
    GLCK->GENCTRL[generator] = gen_val; //see page 150 //TODO: GENEN und DIVSEL bits per funktionsparameter steuern
    while (GLCK->SYNCBUSY & (1<<generator));
    /*2. The Generic Clock for a peripheral must be configured by writing to the Peripheral Channel
    Control register (PCHCTRLm) belonging to the peripheral. The Generator used as the source
    for the Peripheral Clock must be written to the GEN bit field in the Peripheral Channel Control
    register (PCHCTRLm.GEN).*/
    GLCK->PCHCTRL[idx_m] = generator;
    /* When a Generator has been selected, the peripheral clock is enabled by setting the Channel Enable
    bit in the Peripheral Channel Control register, PCHCTRLm.CHEN = 1. The PCHCTRLm.CHEN bit must
    be synchronized to the generic clock domain. PCHCTRLm.CHEN will continue to read as its previous
    state until the synchronization is complete.*/ //see page 144
    GLCK->PCHCTRL[idx_m] |= (1<<CHEN);
    while (!(GLCK->PCHCTRL[idx_m] & (1<<CHEN)));
    return OPERATION_SUCCESS;
}

//configures the main clock to driven by the external clock xosc0 
uint8 glck_set_mlck_ext() { //evtl. noch per funktionsparameter einstellen ob man XOSC1 oder XOSC0 als quelle nimmt
    oscctrl_start_xosc0();
    volatile uint32 gen_val = (1<<GENEN) | (0<<DIVSEL) | (1<<DIV) | 0x00; //take XOSC0 oscillator output aus source, see page 151
    GLCK->GENCTRL[0] = gen_val; //see page 150 //TODO: GENEN und DIVSEL bits per funktionsparameter steuern
    while (GLCK->SYNCBUSY & (1<<0));
    return OPERATION_SUCCESS;
}

//configures the main clock to driven by an external clock source via GLCK_IO[1]
uint8 glck_set_mlck_ext_1() { 
    port_set_glck_io1(); //configures GLCK_IO[1] to be used for external clock input
    volatile uint32 gen_val = (1<<GENEN) | (0<<DIVSEL) | (1<<DIV) | 0x02; //take GLCK_IO[1] as clock-source, see page 151
    GLCK->GENCTRL[1] = gen_val; //see page 150 //TODO: GENEN und DIVSEL bits per funktionsparameter steuern
    while (GLCK->SYNCBUSY & (1<<1));
    gen_val = (1<<GENEN) | (0<<DIVSEL) | (1<<DIV) | 0x03; //take generator 1 as clock-source, see page 151
    GLCK->GENCTRL[0] = gen_val; //see page 150
    while (GLCK->SYNCBUSY & (1<<0));
    return OPERATION_SUCCESS;
}
