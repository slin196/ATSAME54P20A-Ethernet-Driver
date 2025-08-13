
#include "type_definitions.h"
#include "ptp.h"
#include "gmac.h"
#include <stdlib.h>
#include "cmsis_gcc.h"
#include <string.h>
#include <stdio.h>
#include "C:\Users\slin9\Desktop\BA\Project_folder\butten_press_send_1\firmware\src\config\sam_e54_cult\peripheral\dmac\plib_dmac.h"

#define PTP_LOG sprintf
#define HARDSYNC_THRESHOLD  (1ull<<30) //ns update register has only 29 bits available
#define MSG_SYNC            (0x00)            
#define MSG_FOLLOW_UP       (0x08)
#define SEC_IN_NS           (1000000000ull)
#define PRINT 0

#ifndef htons
#define htons(x) ((uint16_t)__REV16(x))
#endif

typedef struct
{
  uint16_t              secondsMsb;		// Some embedded HW implementations only
  uint32_t              secondsLsb;		// support a 32 bit counter for seconds
  uint32_t              nanoseconds;
  uint64_t              correctionField;
} timeStamp_t;

typedef struct
{
  volatile timeStamp_t origin;
  volatile timeStamp_t origin_prev;
  volatile timeStamp_t receipt;
  volatile timeStamp_t receipt_prev;
} ptpSync_ct;

volatile uint8 synched = false;
bool match_freq = true;
uint64_t offset, offset_prev, inc_t = 34952533llu; //34952533ull = 8.33333333333333*(1<<22)
uint64_t max_offset = 1000000000;
static int32_t ptp_sync_sequenceId = -1;
uint8 neg_prev, neg, syncReceived = 0;
uint8 a = 0;
uint8 skip_print = 0;
volatile ptpSync_ct TS_SYNC;

uint8_t uartLocalTxBuffer_v1[200] = {0};

void reset() {
    ptp_sync_sequenceId = -1;
    syncReceived = 0;
}

void processSync_v1(ptp_header* ptpPkt)
{
    uint16_t seqId = htons(ptpPkt->sequenceId);

    if (ptp_sync_sequenceId < 0) {
        ptp_sync_sequenceId = (int32_t)seqId;
    } else if (ptp_sync_sequenceId != seqId) {
        int sequenceDifference = abs(seqId - ptp_sync_sequenceId);
        if (sequenceDifference > 10) reset();
        /*PTP_LOG((char*)uartLocalTxBuffer_v1, "Sequence id mismatch:  %li - %u \r\n", ptp_sync_sequenceId, seqId);
                        DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer_v1, \
                    (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                    strlen((const char*)uartLocalTxBuffer_v1));*/
    }
}

void processFollowUp_v1(ptp_header* ptpPkt)
{
  uint16_t seqId = htons(ptpPkt->sequenceId);
  if (ptp_sync_sequenceId == seqId) {
      TS_SYNC.origin_prev = TS_SYNC.origin;
        /* Get t1 from PTP frame */
      TS_SYNC.origin.secondsMsb  = (ptpPkt->timestamp[0] << 8) | ptpPkt->timestamp[1];
      TS_SYNC.origin.secondsLsb  = ((ptpPkt->timestamp[2] << 24) | (ptpPkt->timestamp[3] << 16) | (ptpPkt->timestamp[4] << 8) | (ptpPkt->timestamp[5]));
      TS_SYNC.origin.nanoseconds = ((ptpPkt->timestamp[6] << 24) | (ptpPkt->timestamp[7] << 16) | (ptpPkt->timestamp[8] << 8) | (ptpPkt->timestamp[9]));
      ptp_sync_sequenceId = (seqId + 1u) % UINT16_MAX;
      syncReceived = 1;
  } else syncReceived = 0;
}

uint64_t tsToInternal_v1(volatile timeStamp_t* ts)
{
  uint64_t seconds = ((uint64_t)ts->secondsMsb << 32u | ts->secondsLsb);
  return (seconds * SEC_IN_NS) + ts->nanoseconds;
}

void correct_clock() {
    
    uint64_t t1 = tsToInternal_v1(&TS_SYNC.origin);
    uint64_t t2 = tsToInternal_v1(&TS_SYNC.receipt);
    
    if (t2 > t1) {
        offset = t2 - t1;
        neg = 1;
    } else {
        offset = t1 - t2;
        neg = 0;
    }
    if (offset>500000) {
        if (PRINT) {
        PTP_LOG((char*)uartLocalTxBuffer_v1, "t2: %llu, t1: %llu, \r\n", t2, t1);
                            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer_v1, \
                        (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                        strlen((const char*)uartLocalTxBuffer_v1));
                            skip_print = 1;
        }
    }

    if (match_freq) {
        
        uint64_t origin_diff =  tsToInternal_v1(&TS_SYNC.origin)  - tsToInternal_v1(&TS_SYNC.origin_prev);
        uint64_t receipt_diff = tsToInternal_v1(&TS_SYNC.receipt) - tsToInternal_v1(&TS_SYNC.receipt_prev);
        //double drift_r_print = (double)origin_diff/(double)receipt_diff;
        if (neg_prev) receipt_diff += offset_prev;
        else receipt_diff -= offset_prev;
        
        uint64_t drift_ratio = (origin_diff<<22)/receipt_diff;
        inc_t *= drift_ratio;
        uint64_t ti_inc = (inc_t & (0xFFFFFllu << 44)) >> 44;
        uint64_t tisu_inc = (inc_t & (0xFFFFllu << 28)) >> 28;
        inc_t >>= 22;
            
        GMAC->TISUBN = (uint32)tisu_inc;
        GMAC->TI = ti_inc;
        /*PTP_LOG((char*)uartLocalTxBuffer_v1, "Drift: %lf \r\n", drift_r_print);*/
    }               
    /*PTP_LOG((char*)uartLocalTxBuffer_v1, "origin sec: %lu origin ns: %lu, receipt sec: %lu receipt ns: %lu \r\n", TS_SYNC.origin.secondsLsb, TS_SYNC.origin.nanoseconds,\
            TS_SYNC.receipt.secondsLsb, TS_SYNC.receipt.nanoseconds);*/
    if (offset>HARDSYNC_THRESHOLD) {
        GMAC->TSL = TS_SYNC.origin.secondsLsb;
        GMAC->TN = TS_SYNC.origin.nanoseconds;
        match_freq = false;
        offset = 0;
        GMAC->TISUBN = 0;
        GMAC->TI = 8 | (9<<8)|(2<<16);
        if (PRINT) {
        PTP_LOG((char*)uartLocalTxBuffer_v1, "doin hardsync origin: %lu, %lu, receipt: %lu, %lu\r\n", TS_SYNC.origin.secondsLsb, TS_SYNC.origin.nanoseconds, TS_SYNC.receipt.secondsLsb, TS_SYNC.receipt.nanoseconds);
                            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer_v1, \
                        (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                        strlen((const char*)uartLocalTxBuffer_v1));
        }
    } else {
        GMAC->TA = ((neg & 1) << 31) | ((uint32)(offset));
        match_freq = true;
        if (offset<5000) synched = true;
        if (synched && !a) {max_offset = 0; a = 1;}
        if (!skip_print) {
            if (PRINT) {
        PTP_LOG((char*)uartLocalTxBuffer_v1, "max_offset: %llu \r\n", max_offset);
                            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer_v1, \
                        (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                        strlen((const char*)uartLocalTxBuffer_v1));
            }
                          
        }
        skip_print = 0;
    }
    if (max_offset < offset) max_offset = offset;
    offset_prev = offset;
    neg_prev = neg;
}
               
void handlePtp_v1(uint8_t* pData, uint32_t sec, uint32_t nsec)
{
    ethernet_frame* frame = (ethernet_frame*) pData;
    if (frame->type_len != 0xF788) return; //no PTP frame
    
    ptp_header* ptpPkt = (ptp_header*) frame->payload;
    uint8_t messageType = ptpPkt->msgType_trnsSpec & 0xFu;

    if(messageType == MSG_SYNC)
    {
        /*PTP_LOG((char*)uartLocalTxBuffer_v1, "in line 164");
                            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer_v1, \
                        (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                        strlen((const char*)uartLocalTxBuffer_v1));*/
      processSync_v1(ptpPkt);
    }
    else if(messageType == MSG_FOLLOW_UP)
    {
        processFollowUp_v1(ptpPkt);
        if(syncReceived)
        {
            TS_SYNC.receipt_prev = TS_SYNC.receipt;
            TS_SYNC.receipt.secondsLsb = sec;
            TS_SYNC.receipt.nanoseconds = nsec;
            correct_clock();
        } else {
            memset((void*)&TS_SYNC, 0, sizeof(ptpSync_ct));
            /*PTP_LOG((char*)uartLocalTxBuffer_v1, "in line 164");
                            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer_v1, \
                        (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                        strlen((const char*)uartLocalTxBuffer_v1));*/
        }
    }
}

