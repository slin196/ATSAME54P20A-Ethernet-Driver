/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 */

#ifndef PORT_H    /* Guard against multiple inclusion */
#define PORT_H

#ifdef __cplusplus
extern "C" {
#endif

    
    
#include "type_definitions.h"

#define PORT ((volatile pin_groups*) (0x41008000))
#define MUXEN 0
#define PMUXO 4
#define PMUXE 0

typedef struct {
    uint32 DIR;
    uint32 DIRCLR;
    uint32 DIRSET;
    uint32 DIRTGL;
    uint32 OUT;
    uint32 OUTCLR;
    uint32 OUTSET;
    uint32 OUTTGL;
    uint32 IN;
    uint32 CTRL;
    uint32 WRCONFIG;
    uint32 EVCTRL;
    uint8  PMUX[16];
    uint8  PINCFG[32];
    uint8  RESERVED[30];
} pin_group_registers;

/* The I/O pins are assembled in pin groups with up to 32 pins. Group 0 consists of the PA pins, and
 group 1 is for the PB pins, etc. Each pin group has its own PORT registers, with a 0x80 address
 spacing.*/ //see page 823
typedef struct {
    volatile pin_group_registers GROUP0;
    volatile pin_group_registers GROUP1;
    volatile pin_group_registers GROUP2;
    volatile pin_group_registers GROUP3;
} pin_groups;

void port_set_rmii_pins(void);
void port_set_glck_io1(void);
void port_set_PB16_asoutput(); 
void port_set_PB24_asoutput();
void port_set_PB28_asoutput();
void port_set_PB30_asoutput();
void port_set_PB28_asoutput();

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif 

/* *****************************************************************************
 End of File
 */
