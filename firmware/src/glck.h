#include "type_definitions.h"

#ifndef _GLCK_H   /* Guard against multiple inclusion */
#define _GLCK_H   //TODO benne das ganze noch in glck.h oder so um, dasselbe auch für das .c file


#ifdef __cplusplus
extern "C" {
#endif
    
#define GLCK            ((volatile glck_registers*) (0x40001C00))
#define GENEN           8
#define DIVSEL          12
#define DIV             16
#define CHEN            6

typedef struct {
    volatile uint8  CTRLA;
    volatile uint8  RESERVED[3];
    volatile uint32 SYNCBUSY;
    volatile uint8  RESERVED1[24];
    volatile uint32 GENCTRL[12];
    volatile uint8  RESERVED2[48];
    volatile uint32 PCHCTRL[48];
} glck_registers;

uint8 glck_config(uint8, volatile void*, uint32);
uint8 glck_set_mlck_ext() ;
    
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
