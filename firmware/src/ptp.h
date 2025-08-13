

#ifndef _PTP_H    /* Guard against multiple inclusion */
#define _PTP_H

#include <stdbool.h>
#include "ethernet.h"

#ifdef __cplusplus
extern "C" {
#endif
    
typedef struct {
    uint8  msgType_trnsSpec;
    uint8  res_versPTP;
    uint16 mLength;
    uint8  domainNumber;
    uint8  reserved;
    uint16 flags;
    uint8  correctionField[8];
    uint8  reserved_1[4];
    uint8  srcPort[10];
    uint16 sequenceId;
    uint8  controlField;
    uint8  logInterval;
    uint8  timestamp[10];
} ptp_header;

ethernet_frame create_ptp_sync_frame(uint8[6], uint8[6], bool, uint8);

ethernet_frame create_ptp_802_1as_Sync_frame(uint8[6], bool, uint8);

ethernet_frame create_ptp_802_1as_Pdelay_Req_frame(uint8[6], uint8);

ethernet_frame create_ptp_802_1as_Pdelay_Resp_frame(uint8[6], bool, uint8);

ethernet_frame create_ptp_802_1as_Follow_Up_frame(uint8[6], uint8[6], uint8);

ethernet_frame create_ptp_IEEE_1588_Sync_frame(uint8[6], uint8[6], bool, uint8);

ethernet_frame create_ptp_IEEE_1588_Delay_Req_frame(uint8[6], uint8[6], uint8);
        
ethernet_frame create_ptp_IEEE_1588_Follow_Up_frame(uint8[6], uint8[6], uint8);
        
ethernet_frame create_ptp_frame(uint8[6], uint8[6], bool, uint8, uint8);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif

/* *****************************************************************************
 End of File
 */
