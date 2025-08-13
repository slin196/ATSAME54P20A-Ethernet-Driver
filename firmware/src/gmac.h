
#ifndef _GMAC_H    /* Guard against multiple inclusion */
#define _GMAC_H

//#include "ethernet.h"
#include "type_definitions.h"

#ifdef __cplusplus
extern "C" {
#endif

#define GMAC ((volatile gmac_registers*) (0x42000800)) //see IO-VIEW or PAGE 47
#define RCOMP                1
#define TXEN                 3   // Transmit Enable
#define RXEN                 2   // Receive Enable
#define TSTART               9   // Start Transmission
#define CLRSTAT              5   // Clear Status Register
#define THALT                10
#define NCFGR_SPD            0   // 10/100 Mbps (0=10, 1=100 Mbps)
#define NCFGR_FD             1   // full Duplex Mode
#define MPE                  4
#define TXPF                 11
#define TXCOMP               5
#define TCOMP                7
#define DRBS                 16
#define MAX_DESCR_LIST_IDX   30
#define MAX_PACKET_QUEUE_IDX (MAX_DESCR_LIST_IDX)
#define TX_DESCR_QUEUE_LEN   (MAX_DESCR_LIST_IDX)
#define FINISHED_OPS_MAX_IDX (5000)
    

typedef struct {
    u_int32_t NCR;
    u_int32_t NCFGR;
    u_int32_t NSR;
    u_int32_t UR;
    u_int32_t DCFGR;
    u_int32_t TSR;
    u_int32_t RBQB;
    u_int32_t TBQB;
    u_int32_t RSR;
    u_int32_t ISR;
    u_int32_t IER;
    u_int32_t IDR;
    u_int32_t IMR;
    u_int32_t MAN;
    u_int32_t RPQ;
    u_int32_t TPQ;
    u_int32_t TPSF;
    u_int32_t RPSF;
    u_int32_t RJFML;
    u_int32_t RESERVED[13];
    u_int32_t HRB;
    u_int32_t HRT;
    u_int32_t SAB0;
    u_int32_t SAT0;
    u_int32_t SAB1;
    u_int32_t SAT1;
    u_int32_t SAB2;
    u_int32_t SAT2;
    u_int32_t SAB3;
    u_int32_t SAT3;
    u_int32_t TIDM0;
    u_int32_t TIDM1;
    u_int32_t TIDM2;
    u_int32_t TIDM3;
    u_int32_t WOL;
    u_int32_t IPGS;
    u_int32_t SVLAN;
    u_int32_t TPFCP;
    u_int32_t SAMB1;
    u_int32_t SAMT1;
    u_int32_t RESERVED1[3];
    u_int32_t NSC;
    u_int32_t SCL;
    u_int32_t SCH;
    u_int32_t EFTSH;
    u_int32_t EFRSH;
    u_int32_t PEFTSH;
    u_int32_t PEFRSH;
    u_int32_t RESERVED2[2];
    u_int32_t OTLO;
    u_int32_t OTHI;
    u_int32_t FT;
    u_int32_t BCFT;
    u_int32_t MFT;
    u_int32_t PFT;
    u_int32_t BFT64;
    u_int32_t TBFT127;
    u_int32_t TBFT255;
    u_int32_t TBFT511;
    u_int32_t TBFT1023;
    u_int32_t TBFT1518;
    u_int32_t GTBFT1518;
    u_int32_t TUR;
    u_int32_t SCF;
    u_int32_t MCF;
    u_int32_t EC;
    u_int32_t LC;
    u_int32_t DTF;
    u_int32_t CSE;
    u_int32_t ORLO;
    u_int32_t ORHI;
    u_int32_t FR;
    u_int32_t BCFR;
    u_int32_t MFR;
    u_int32_t PFR;
    u_int32_t BFR64;
    u_int32_t TBFR127;
    u_int32_t TBFR255;
    u_int32_t TBFR511;
    u_int32_t TBFR1023;
    u_int32_t TBFR1518;
    u_int32_t TMXBFR;
    u_int32_t UFR;
    u_int32_t OFR;
    u_int32_t JR;
    u_int32_t FCSE;
    u_int32_t LFFE;
    u_int32_t RSE;
    u_int32_t AE;
    u_int32_t RRE;
    u_int32_t ROE;
    u_int32_t IHCE;
    u_int32_t TCE;
    u_int32_t UCE;
    u_int32_t RESERVED3[2];
    u_int32_t TISUBN;
    u_int32_t TSH;
    u_int32_t RESERVED4[1];
    u_int32_t TSSSL;
    u_int32_t TSSN;
    u_int32_t TSL;
    u_int32_t TN;
    u_int32_t TA;
    u_int32_t TI;
    u_int32_t EFTSL;
    u_int32_t EFTN;
    u_int32_t EFRSL;
    u_int32_t EFRN;
    u_int32_t PEFTSL;
    u_int32_t PEFTN;
    u_int32_t PEFRSL;
    u_int32_t PEFRN;
    u_int32_t RESERVED5[28];
    u_int32_t RLPITR;
    u_int32_t RLPITI;
    u_int32_t TLPITR;
    u_int32_t TLPITI;
} gmac_registers;

typedef struct {
    uint32 word_0;
    uint32 word_1;
} buffer_descriptor;

typedef struct
{
    uint16 s_low;
    uint32_t ns;
} timestamp;

typedef struct {
    uint8 flags;
    uint16 op_number;
    timestamp TS_MAC;
    timestamp TS_RMII;
} op_descriptor;

void GMAC_Handler(void);
void gmac_set_interrupts(void);
void take_timestamp(volatile timestamp*);
uint8 gmac_reset(void);
uint8 gmac_config_receive_buffers(uint32);
uint8 gmac_config_transmit_buffers(uint32);
uint8 gmac_config(uint32, uint32, uint8[4][6], uint8, uint8, uint8, uint8, uint8);
uint8 gmac_config_address_registers(uint8[4][6]);
uint8 gmac_send_packet(uint8 *, uint16);
uint8 gmac_set_macaddress(const uint8_t *);
uint8 gmac_send_frame(uint8 *, uint16);

buffer_descriptor rx_descriptor_list[MAX_DESCR_LIST_IDX];
buffer_descriptor tx_descriptor_list[MAX_DESCR_LIST_IDX]; //das ganze 16 byte alignen? dann zählt der TBQB evtl. nicht jedes mal um 0x10 hoch

uint8 __attribute__((aligned(8))) tx_frame_buffer[1526*MAX_PACKET_QUEUE_IDX]; //TODO: entscheide noch ob es eine queue oder ringbuffer wird, vll. kann man auch beides irgendwie vereinen
uint8 __attribute__((aligned(8))) rx_frame_buffer[1536*MAX_PACKET_QUEUE_IDX]; //TODO: die änderung von 1522 auf 1526 bytes ist bisjetzt nur in diesem projekt vollzogen, auch noch in die anderen source files pakcen
 
#ifdef __cplusplus
}
#endif

#endif 
