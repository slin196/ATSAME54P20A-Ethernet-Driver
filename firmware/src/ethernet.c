
//#include "ethernet.h"
#include "ptp.h"


ethernet_frame create_ethernet_frame(uint8 dest_addr[6], uint8 src_addr[6], uint16 len_or_type, uint8* payload) {
    ethernet_frame frame = {
        .type_len = ((0xFF & len_or_type) << 8) | ((len_or_type & 0xFF00) >> 8)
    };
    for (uint8 i = 0; i<6; ++i) {
        frame.dmac[i] = dest_addr[i];
        frame.smac[i] = src_addr[i];
    }

    uint16 payload_length = 0;
    if (len_or_type <= 1536) payload_length = len_or_type;
    else {
        switch(len_or_type) {
            case 0x88F7: payload_length = sizeof(ptp_header);
            //TODO: implement remaining protocol handlers
        }
    }
    for (uint16 i = 0; i<payload_length; ++i) frame.payload[i] = payload[i];
    return frame;
}

