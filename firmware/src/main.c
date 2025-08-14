
#include <stdio.h>
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include <string.h>
#include "ptp.h"
#include "definitions.h"                // SYS function prototypes
#include "type_definitions.h"
#include "gmac.h"
#include "port.h"
#include "phy_driver.h"
#include "glck.h"
#include "plca_settings.h"
#include "node_settings.h"
#include "ptp_algo.h"

#define SWITCH_PRESSED_STATE 1


volatile uint8 send = 1;
volatile uint8 stop = 0;
extern uint8 tx_complete;
static volatile bool isUARTTxComplete = true;
uint64_t curr_time, task_1_offset, task_2_offset, task_3_offset;
//extern uint8 rx_op_complete, tx_op_complete, tx_op_descr_enqueue_v1, tx_op_descr_enqueue_v2;
/*extern uint8 tx_op_descr_dequeue;
extern uint8 tx_op_descr_enqueue;
extern uint8 rx_op_descr_dequeue;
extern uint8 rx_op_descr_enqueue;*/
bool ops_finished = false;


static void EIC_SW0_User_Handler(uintptr_t context)
{
    if(SW1_Get() == SWITCH_PRESSED_STATE)
    {
        stop = 1;
    }
}

static void EIC_SW1_User_Handler(uintptr_t context)
{
    if(SW2_Get() == SWITCH_PRESSED_STATE)
    {
        send = 1;
    }
}

static void usartDmaChannelHandler(DMAC_TRANSFER_EVENT event, uintptr_t contextHandle)
{
    if (event == DMAC_TRANSFER_EVENT_COMPLETE)
    {
        isUARTTxComplete = true;
    }
}

static uint8 uartLocalTxBuffer[200] = {0};

#define PTP_LOG sprintf
extern uint8 rx_descr_idx, rx_enqueue;
uint8 rx_dequeue = 0;
extern volatile uint32 nanoseconds, seconds_low;

void Service_PTP() {
    volatile uint32 rsr_read = GMAC->RSR;
    if (!rsr_read) return;
    if (rsr_read & (1 << 1)) {
        GMAC->RSR |= 1<<1;
        //LED1_Toggle();
        handlePtp_v1(&rx_frame_buffer[rx_dequeue*1536], seconds_low, nanoseconds); // das hier vll. direkt durch register auslese ersetzen
        rx_dequeue = (rx_dequeue + 1) % MAX_PACKET_QUEUE_IDX;
        if (rx_dequeue != rx_enqueue) {
            PTP_LOG((char*)uartLocalTxBuffer, "frame processing out of sync\r\n");
            if (isUARTTxComplete) {
            isUARTTxComplete = 0;
            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer, \
                    (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                    strlen((const char*)uartLocalTxBuffer));
            }
        }
    }
    if (rsr_read & (1 << 0)) {
        GMAC->RSR |= (1<<0);
        PTP_LOG((char*)uartLocalTxBuffer, "\r\nBuffer not available");
        if (isUARTTxComplete) {
            isUARTTxComplete = 0;
            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer, \
                    (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                    strlen((const char*)uartLocalTxBuffer));
        }
    }
    
    if (rsr_read & (1 << 2)) {
        GMAC->RSR |= (1<<2);
        PTP_LOG((char*)uartLocalTxBuffer, "\r\nReceive Overrun");
        if (isUARTTxComplete) {
            isUARTTxComplete = 0;
            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer, \
                    (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                    strlen((const char*)uartLocalTxBuffer));
        }
    }
        if (rsr_read & (1 << 3)) {
        GMAC->RSR |= (1<<3);
        PTP_LOG((char*)uartLocalTxBuffer, "\r\nHRESP NOT OK");
        if (isUARTTxComplete) {
            isUARTTxComplete = 0;
            DMAC_ChannelTransfer(DMAC_CHANNEL_0, uartLocalTxBuffer, \
                    (const void *)&(SERCOM1_REGS->USART_INT.SERCOM_DATA), \
                    strlen((const char*)uartLocalTxBuffer));
        }
    }
}

uint64_t get_time() {
    uint64_t ns = GMAC->TN & 0x3fffffff;
    uint64_t tsl = GMAC->TSL;
    return tsl * 1000000000ull + ns;
}

uint32_t op_number = 0;
extern volatile uint8 tsr_status;
extern volatile uint8 begin;
extern uint8 free_next;
uint8 rx_op_dequeue = 0;
uint8 tx_op_dequeue = 0;

//extern tx_timestamps tasks_1_timestamp;


int main ( void )
{
    uint8 uartLocalTxBuffer[100];
    uint8 addresses[4][6] = {{0x00,0x04,0x25,0x1C,0xA0,0x02},{0x00,0x04,0x25,0x1C,0xA0,0x02},{0xFF,0xFF,0xFF,0xFF,0xFF,0xFF},{0xFF,0xFF,0xFF,0xFF,0xFF,0xFF}};
    /* Initialize all modules */
    SYS_Initialize (NULL);
    uint8 op_res = 0;
    op_res |= gmac_config(MAX_DESCR_LIST_IDX, MAX_DESCR_LIST_IDX, addresses, NODE_ID,  NODE_COUNT, TO_TIMESPAN, BURSTCOUNT, BURSTTIME);
    if (op_res == OPERATION_FAILURE) return op_res;
    DMAC_ChannelCallbackRegister(DMAC_CHANNEL_0, usartDmaChannelHandler, 0);
    EIC_CallbackRegister(EIC_PIN_0, EIC_SW0_User_Handler, 0);
    EIC_CallbackRegister(EIC_PIN_1, EIC_SW1_User_Handler, 0);
    uint8 broadcast[6] = {0xff,0xff,0xff,0xff,0xff,0xff};
    //uint8 ptp_multicast[6] = {0x01, 0x1B, 0x19, 0x00, 0x00, 0x00};
    uint8 src_addr[6] = {0x12,0x34,0x56,0x78,0x91,0x12};
    ethernet_frame as_Pdelay_req_frame = create_ptp_802_1as_Pdelay_Req_frame(broadcast, 4);
    uint8 offset = sizeof(ptp_header);
    as_Pdelay_req_frame.payload[offset]   = NODE_ID; //#ifdefs noch hinzuf�gen
    uint8 offset_op_number = offset + 2;
    for (uint8 i = 0; i<MAX_PACKET_QUEUE_IDX; ++i) {
        memcpy((void*)&tx_frame_buffer[1526*i], (const void*)&as_Pdelay_req_frame, 1514);
    }
    GMAC->TI = 8 | (9<<8)|(2<<16); /*[1, p. 581] 8*2 + 9 = 3*8.3333333333333333333333333..........
                                   8.333333333...ns is the period which corresponds to the native CPU frequency of 120Mhz*/
    //while((!synched)||(get_time()<=(10000000000ull))) Service_PTP(); //30000000000ull evtl. noch als makro
    uint64_t init_time = get_time();
    uint64_t break_point = init_time + 10ull * 1000ull * MS_TO_NS;
    task_1_offset = TASK_1_STARTUPTIME + init_time;
    task_2_offset = TASK_2_STARTUPTIME + init_time;
    task_3_offset = TASK_3_STARTUPTIME + init_time;
    uint8 next_frame_idx = 0;
    RESTART:
    while ( true ) {
        Service_PTP();
        curr_time = get_time();
        if (task_1_offset <= curr_time) {
            ethernet_frame* frame = (ethernet_frame*)&tx_frame_buffer[1526*next_frame_idx];
            frame->payload[offset_op_number] = (op_number&0xFF00)>>8;
            op_res = gmac_send_frame((uint8*)frame, TASK_1_PAYLOAD);
            if (op_res != 2) next_frame_idx = (next_frame_idx + 1) % MAX_DESCR_LIST_IDX;
            task_1_offset += TASK_1_PERIOD;
        }
        if ((stop)||(curr_time>break_point)) break; //TODO: hier noch durch das timelimit substituieren
    }
    stop = 0;
    while (true) {
        //LED1_Toggle();
        if (stop) {
            stop = 0;
            goto RESTART;
#ifndef HARDWARE_SYNCH
            /*GMAC->TI = 0;
            GMAC->TN = 0;
            GMAC->TI = 8 | (9<<8)|(2<<16); //[1, p. 581] */
#endif
        }
    }
    return EXIT_FAILURE;
}
        