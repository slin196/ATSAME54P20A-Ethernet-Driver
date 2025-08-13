/*code and comments are partly based on the following source:
 *https://support.huawei.com/enterprise/en/doc/EDOC1100174721/7631975b/general-format-of-ptp-messages#tab_flag_field
 */

#include "type_definitions.h"
//#include "ethernet.h"
#include "ptp.h"
#include <stdbool.h>                    // Defines true

ethernet_frame create_ptp_sync_frame(uint8 dest_addr[6], uint8 src_addr[6], bool two_step, uint8 LogMsgInt) {
    //TODO: noch zu löschen in der finalen version, die quellen noch oben hinzufügen und im code richtig referenzieren
    //https://support.huawei.com/enterprise/en/doc/EDOC1100174721/7631975b/general-format-of-ptp-messages#tab_flag_field
    //https://www.ieee802.org/1/files/public/docs2007/as-garner-protocol-state-machines-frame-formats-0307.pdf
    ptp_header sync_frame_header = {
        .msgType_trnsSpec = 0, //TODO: hier noch im trnsSpec festlegen ob es sich um IEEE 802.1as oder IEEE 1588 handelt, IEEE 802.1as ist 
        //wahrscheinlich eher angebracht, siehe https://support.huawei.com/enterprise/en/doc/EDOC1100174721/7631975b/general-format-of-ptp-messages#tab_flag_field
        //und https://www.ni.com/docs/de-DE/bundle/sbrio-system-dev/page/differences-between-ieee-802.1as-2011.html
        //Für messframes bei Testsetup P2P knopfdruck auf 0 lassen: indicates that the PTP message is used by IEEE 1588., 1 indiziert 802.1AS
        .res_versPTP = 2<<4, 
        .mLength = 35, 
        .domainNumber = 0,
        .reserved = 0,
        .flags = (two_step == true ? 1: 0) << 1,
        .controlField = 0,
        .logInterval = LogMsgInt
    };
    return create_ethernet_frame(dest_addr, src_addr, 0x88F7, (uint8*)&sync_frame_header);
}

ethernet_frame create_ptp_802_1as_Sync_frame(uint8 src_addr[6], bool two_step, uint8 LogMsgInt) {
    uint8 msgType_trnsSpec = (1<<4)| 0x00;
    //https://eci.intel.com/docs/3.0/development/tsnrefsw/tsn-overview.html#gptp-clock-types
    uint8 dest_addr[6] = {0x01 ,0x1B, 0x19, 0x00 ,0x00, 0x00};
    return create_ptp_frame(dest_addr, src_addr, two_step, msgType_trnsSpec, LogMsgInt);
}

ethernet_frame create_ptp_802_1as_Pdelay_Req_frame(uint8 src_addr[6], uint8 LogMsgInt) {
    uint8 msgType_trnsSpec = (1<<4)| 0x02;
    //https://eci.intel.com/docs/3.0/development/tsnrefsw/tsn-overview.html#gptp-clock-types
    uint8 dest_addr[6] = {0x01 ,0x80, 0xC2, 0x00 ,0x00, 0x0E};
    return create_ptp_frame(dest_addr, src_addr, 0, msgType_trnsSpec, LogMsgInt);
}

ethernet_frame create_ptp_802_1as_Pdelay_Resp_frame(uint8 src_addr[6], bool two_step, uint8 LogMsgInt) {
    //https://eci.intel.com/docs/3.0/development/tsnrefsw/tsn-overview.html#gptp-clock-types
    uint8 msgType_trnsSpec = (1<<4)| 0x03;
    uint8 dest_addr[6] = {0x01 ,0x80, 0xC2, 0x00 ,0x00, 0x0E};
    return create_ptp_frame(dest_addr, src_addr, two_step, msgType_trnsSpec, LogMsgInt);
}

ethernet_frame create_ptp_802_1as_Follow_Up_frame(uint8 dest_addr[6], uint8 src_addr[6], uint8 LogMsgInt) {
    uint8 msgType_trnsSpec = (1<<4)| 0x08;
    //TODO: hier als dest_addr fix die ptp multicast addr angeben oder?
    return create_ptp_frame(dest_addr, src_addr, 0, msgType_trnsSpec, LogMsgInt);
}

ethernet_frame create_ptp_IEEE_1588_Sync_frame(uint8 dest_addr[6], uint8 src_addr[6], bool two_step, uint8 LogMsgInt) {
    uint8 msgType_trnsSpec = (0<<0)| 0x00;
     //TODO: hier als dest_addr fix die ptp multicast addr angeben oder?
    return create_ptp_frame(dest_addr, src_addr, two_step, msgType_trnsSpec, LogMsgInt);
}

ethernet_frame create_ptp_IEEE_1588_Delay_Req_frame(uint8 dest_addr[6], uint8 src_addr[6], uint8 LogMsgInt) {
    uint8 msgType_trnsSpec = (0<<0)| 0x01;
     //TODO: hier als dest_addr fix die ptp multicast addr angeben oder?
    return create_ptp_frame(dest_addr, src_addr, 0, msgType_trnsSpec, LogMsgInt);
}

ethernet_frame create_ptp_IEEE_1588_Follow_Up_frame(uint8 dest_addr[6], uint8 src_addr[6], uint8 LogMsgInt) {
    uint8 msgType_trnsSpec = (0<<0)| 0x08;
     //TODO: hier als dest_addr fix die ptp multicast addr angeben oder?
    return create_ptp_frame(dest_addr, src_addr, 0, msgType_trnsSpec, LogMsgInt);
}

ethernet_frame create_ptp_frame(uint8 dest_addr[6], uint8 src_addr[6], bool two_step, uint8 msgType_trnsSpec, uint8 LogMsgInt) {
    //TODO
    //https://support.huawei.com/enterprise/en/doc/EDOC1100174721/7631975b/general-format-of-ptp-messages#tab_flag_field
    //https://www.ieee802.org/1/files/public/docs2007/as-garner-protocol-state-machines-frame-formats-0307.pdf
    ptp_header ptp_frame_header = {
        .msgType_trnsSpec = msgType_trnsSpec, 
        .res_versPTP = 2<<4, 
        .mLength = 35, 
        .domainNumber = 0,
        .reserved = 0,
        .flags = (two_step == true ? 1: 0) << 1,
        .controlField = 0,
        .logInterval = LogMsgInt
    };
     //TODO: hier als dest_addr fix die ptp multicast addr angeben oder? 0x88F7
    return create_ethernet_frame(dest_addr, src_addr, 0x88F7, (uint8*)&ptp_frame_header);
}