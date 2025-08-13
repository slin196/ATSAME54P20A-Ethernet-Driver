

#ifndef _ETHERNET_H    /* Guard against multiple inclusion */
#define _ETHERNET_h

#include "type_definitions.h"


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif


typedef struct {
    uint8 dmac[6];
    uint8 smac[6];
    //TODO: evtl. noch 802.1Q tag schaffen (optional)
    uint16 type_len;
    uint8 payload[1500];
    //TODO: evtl. noch einem member für die CRC zum abschluss schaffen
} ethernet_frame;

ethernet_frame create_ethernet_frame(uint8*, uint8*, uint16, uint8*);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif

/* *****************************************************************************
 End of File
 */
