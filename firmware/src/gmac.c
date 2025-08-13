
/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 *SAM D5x/E5x Family Datasheet will be referenced as [1], i.e. IEEE citation style
 */

//#include "type_definitions.h"
#include <stdlib.h>
#include "gmac.h"
#include "phy_driver.h"
#include "ptp.h"
#include "mclk.h"
#include "port.h"
#include "gmac.h"
#include "string.h"
#include "ptp_algo.h"
//#include "ethernet.h"

#define MSG_FOLLOW_UP   0x8
#define MSG_SYNC        0x0

uint8 rx_descr_idx = 0;
uint8 tx_descr_idx_enqueue = 0;
uint8 tx_descr_idx_dequeue = 0;
uint8 rx_queue_idx = 0;
uint8 tx_queue_idx = 0;
volatile uint32 nanoseconds = 0;
volatile uint32 seconds_low = 0;
uint8 txframe_buffer_empty = 1;
uint8 tx_index = 0;
uint8 rx_enqueue = 0;
uint8 rx_op_complete = 0;
uint8 tx_op_complete = 0;
uint8 tsr_status = 0;
uint8 free_next = 0;
uint8 use_next = 0;
uint8 buffer_space = MAX_DESCR_LIST_IDX;
extern volatile uint16 next_rx_op_idx;
extern volatile uint16 next_tx_op_idx;
extern volatile uint16 finished_rx_ops;
//extern op_descriptor ops[FINISHED_OPS_MAX_IDX];
extern volatile uint16 finished_tx_ops;
extern volatile uint8 ops_finished;
extern uint16 op_number;
volatile op_descriptor rx_op_descr_queue[MAX_DESCR_LIST_IDX];
volatile op_descriptor tx_op_descr_queue[MAX_DESCR_LIST_IDX]; //die länge des array hier vll. noch durch rx- und tx decriptor makros ersetzen
//op_descriptor finished_ops[FINISHED_OPS_MAX_IDX];


void GMAC_Handler() {
    
    volatile uint32 isr_read = GMAC->ISR; //reading clears the interrupt source
    volatile uint32 tx_status = GMAC->TSR;
    
    if (tx_status & ~((1<<5)|(1<<3)|(1<<0)|(1<<1))) {
        tsr_status = tx_status & (~((1<<5)|(1<<3)|(1<<0)|(1<<1)));
    } else tsr_status = 0;
    GMAC->TSR |= GMAC->TSR;
    if ((isr_read & (1<<TCOMP)) || (isr_read & (1<<6))||(isr_read & (1<<11))) {
        //GMAC->NCR |= (1 << THALT);
        finished_tx_ops = (finished_tx_ops +1) % MAX_DESCR_LIST_IDX;
        ++buffer_space;
        if (buffer_space!=MAX_DESCR_LIST_IDX) {
            if (free_next == (MAX_DESCR_LIST_IDX-1)) GMAC->TBQB = (uintptr_t) &tx_descriptor_list[0];
            GMAC->NCR |= (1 << TSTART);
            GMAC->NCR |= (1 << THALT);
        }
        free_next = ((free_next + 1) % MAX_DESCR_LIST_IDX); //MAX_DESCR_LIST_IDX
        ++tx_op_complete;
        ++op_number;
    }
    
    if (isr_read & (1 << 19)) { //sync_frame received
        nanoseconds = GMAC->EFRN & 0x3FFFFFFF;  //[1, p. 585]
        seconds_low = GMAC->EFRSL;
    }
    if (isr_read & (1 << 24)) { //Bit 24 ? DRQFT?PTP Delay Request Frame Transmitted
        tx_op_descr_queue[finished_tx_ops].TS_RMII.ns = GMAC->PEFTN;
        tx_op_descr_queue[finished_tx_ops].TS_RMII.s_low = GMAC->PEFTSL;
    }
    if (isr_read & (1 << 22)) { //Bit 22 ? DRQFT?PTP Delay Request Frame Received
        rx_op_descr_queue[next_rx_op_idx].TS_RMII.ns = GMAC->PEFRN;
        rx_op_descr_queue[next_rx_op_idx].TS_RMII.s_low = GMAC->PEFRSL;
        next_rx_op_idx = (next_rx_op_idx + 1) % MAX_DESCR_LIST_IDX;
    }
    if (isr_read & (1 << RCOMP)) {
        take_timestamp(&rx_op_descr_queue[finished_rx_ops].TS_MAC);
        ethernet_frame* rx_frame = (ethernet_frame*) &rx_frame_buffer[rx_descr_idx*1536];
        if (rx_frame->type_len == 0xF788) {
            ptp_header* ptpPkt = (ptp_header*) rx_frame->payload;
            uint8_t messageType = ptpPkt->msgType_trnsSpec & 0xFu;
            if ((messageType == MSG_SYNC) || (messageType == MSG_FOLLOW_UP)) {
                ;
                //handlePtp_v1((uint8_t*)rx_frame, seconds_low, nanoseconds);
            } else {
                uint16 rx_op_number = 0;
                uint8 node_nr = (uint16)rx_frame->payload[sizeof(ptp_header) + 1];
                rx_op_number |= (uint16)rx_frame->payload[sizeof(ptp_header) + 2] << 8;
                rx_op_number |= (uint16)rx_frame->payload[sizeof(ptp_header) + 3];
                uint8 task_nr = (uint16)rx_frame->payload[sizeof(ptp_header) + 4];
                rx_op_descr_queue[finished_rx_ops].flags = (1<<7) | (node_nr << 4) | (task_nr<<0);
                rx_op_descr_queue[finished_rx_ops].op_number = rx_op_number;
                finished_rx_ops = (finished_rx_ops + 1) % MAX_DESCR_LIST_IDX;
                ++rx_op_complete;
            }
        } else {
            /*uint16 frame_len = rx_descriptor_list[rx_descr_idx].word_1 & 0x1FFF;
            rx_op_descr_queue[next_rx_op_idx].TS_RMII.s_low = 0;
            rx_op_descr_queue[next_rx_op_idx].TS_RMII.ns = 0;
            rx_op_descr_queue[next_rx_op_idx].TS_RMII.ns |= (uint16)rx_frame->payload[frame_len-3];
            rx_op_descr_queue[next_rx_op_idx].TS_RMII.ns |= (uint16)rx_frame->payload[frame_len-2] << 8;
            rx_op_descr_queue[next_rx_op_idx].TS_RMII.ns |= (uint16)rx_frame->payload[frame_len-1] << 16;
            rx_op_descr_queue[next_rx_op_idx].TS_RMII.ns |= (uint16)rx_frame->payload[frame_len]   << 24;
            uint16 rx_op_number = 0;
            uint8 node_nr = (uint16)rx_frame->payload[1];
            rx_op_number |= (uint16)rx_frame->payload[2];
            rx_op_number |= (uint16)rx_frame->payload[3];
            uint8 task_nr = (uint16)rx_frame->payload[4];
            rx_op_descr_queue[next_rx_op_idx].flags = (1<<7) | (node_nr << 4) | (task_nr<<0);
            rx_op_descr_queue[next_rx_op_idx].op_number = rx_op_number;
            finished_rx_ops = (finished_rx_ops + 1) % MAX_DESCR_LIST_IDX;
            next_rx_op_idx = (next_rx_op_idx + 1) % MAX_DESCR_LIST_IDX;
            ++rx_op_complete;*/
        }
        //TODO: HIER NOCH AUF EINEN RX-BUFFER UEBERLAUF CHECKEN und das dann über uart für den versuchsaufbau auch ausgeben,
        //weiterhin auf hardwarefehler checken
        rx_descriptor_list[rx_descr_idx].word_0 &= ~1; //...bit 0 of word 0 set to 0. //TODO: Das markieren als benutzbar sollte im echtfall erst geschehen wenn das paket
        rx_descriptor_list[rx_descr_idx].word_1 = (uint32) 0; //see also [1, p. 445]  //aus dem buffer entnommen wurde und damit zur verarbeitung zu verfügung steht, d.h. alles
                                          //gemacht wurde/gemacht werden kann was man damit machen kann, erst dann sollte man ein 
                                          //neues paket an seine stelle schreiben, d.h. das clearen des bits sollte durch die tasks
        rx_enqueue = (rx_enqueue + 1)%MAX_DESCR_LIST_IDX;
        GMAC->RBQB = (uintptr_t)&rx_descriptor_list[rx_descr_idx = (rx_descr_idx + 1)%MAX_DESCR_LIST_IDX];
    //#endif
    }
}

uint8 gmac_reset(void) {
    /*"Initialization of the GMAC configuration (e.g., loop back mode, frequency ratios) must be done while
    the transmit and receive circuits are disabled. See the description of the Network Control register
    and Network Configuration register earlier in this document.
    1. Write to Network Control register to disable transmit and receive circuits."*/ //[1, p. 467]
    GMAC->NCR = 0; // GMAC reset, disables receive and transmit circuits by setting by setting TXEN and RXEN to 0
    //GMAC->NCR |= (1<<15); //see [1, p. 467], enables timestamping of packets
    GMAC->NCFGR |= (1<<25);  /*If bit 25 of the Network Configuration register is not set, a frame will not be copied to memory if the
    GMAC is transmitting in half duplex mode at the time a destination address is received.[1, p. 467]*/
    return OPERATION_SUCCESS;
}

uint8 gmac_config_receive_buffers(uint32 num_of_buffers) {
    
    //configure the size of each receive buffer, see page 487 i.e section 24.9.5 of datasheet
    //set buffer size to maximum possible ethernet II frame size (1536) bytes
    uint8 buffersize = 1536 >> 6; //buffersize is defined as multiple of 64, see [1, p. 487]
    if (buffersize != 2) { //default DRBS-bitfield in DCFGR has value 0x2 [1, p. 487]
        GMAC->DCFGR |= buffersize << DRBS;
        if (DRBS & 0x2) GMAC->DCFGR ^= 2 << DRBS;
    }
    /*"1. Allocate a number (N) of buffers of X bytes in system memory, where X is the DMA buffer length
    programmed in the DMA Configuration register."*/ //see [1, p. 468]
    uintptr_t buffer_start = (uintptr_t) rx_frame_buffer; 
    //TODO test schreiben der checkt ob num_of_buffers * buffersize eine gewisse grenze ï¿½berschreitet, letztendlich das worauf
    //das vorige TODO anspielt <--der test kommt eher in das parsen des configfiles
    
    /*2. Allocate an area 8N bytes for the receive buffer descriptor list in system memory and create N
      entries in this list. Mark all entries in this list as owned by GMAC, i.e., bit 0 of word 0 set to 0.*/ //see 467
    for (int i = 0; i<num_of_buffers; ++i) {
        rx_descriptor_list[i].word_0 = (uintptr_t)buffer_start + i * 1536; //1518 => create in each buffer enough space for frame of maximum size
        rx_descriptor_list[i].word_0 &= ~1; //...bit 0 of word 0 set to 0.
        //rx_descriptor_list[i].word_0 |= (1<<1); 
        rx_descriptor_list[i].word_1 = (uint32) 0; //see also [1, p. 445]
    }
    /*3. Mark the last descriptor in the queue with the wrap bit (bit 1 in word 0 set to 1)*/ //468, 445
    rx_descriptor_list[num_of_buffers-1].word_0 |= (1<<1); 
    /*4. Write address of receive buffer descriptor list and control information to GMAC register receive
     buffer queue pointer*/ //page 468
    GMAC->RBQB = (uint32) rx_descriptor_list;;
    /* 5. The receive circuits can then be enabled by writing to the address recognition registers and the
     Network Control register.*/ //p. 468
    GMAC->NCR |= 1<<RXEN;    
    return OPERATION_SUCCESS;
}

void gmac_reset_receive_buffers() {
    
    for (int i = 0; i<MAX_DESCR_LIST_IDX; ++i) {
        rx_descriptor_list[i].word_0 &= ~1; //...bit 0 of word 0 set to 0.
        rx_descriptor_list[i].word_1 = (uint32) 0; //see also [1, p. 445]
    }
    
    rx_descriptor_list[MAX_DESCR_LIST_IDX-1].word_0 |= (1<<1); 
    
    GMAC->RBQB = (uint32) rx_descriptor_list;
}


uint8 gmac_config_transmit_buffers(uint32 num_of_buffers) {//num of buffers noch mit passendem macro in der init-funkion belegen
    
    /*1. Allocate a number (N) of buffers of between 1 and 2047 bytes of data to be transmitted in
    system memory. Up to 128 buffers per frame are allowed.*/ //see 468
    //TODO evtl. noch eine variable fï¿½r die obergrenze des buffers festlegen die sich aus tx_buffer_start+ num_of_buffers*buffersize
    //ergibt <--den check hier eher in das python programm das das config file parst
    /*2. Allocate an area 8N bytes for the transmit buffer descriptor list in system memory and create N
       entries in this list. Mark all entries in this list as owned by GMAC, i.e., bit 31 of word 1 set to 0.*/ //see 468
    for (uint32 i = 0; i<num_of_buffers; ++i) {    //initialize the receive buffer descriptor list
        tx_descriptor_list[i].word_0 = (uint32) 0; //clear everything, see page 449, table 24-3
        tx_descriptor_list[i].word_1 = (uint32) (1<<31);
    }
    /*" 3. Mark the last descriptor in the queue with the wrap bit (bit 30 in word 1 set to 1)."*/ //468, 448
    tx_descriptor_list[num_of_buffers-1].word_1 |= (1 << 30); 
    /*" 4. Write address of transmit buffer descriptor list and control information to GMAC register
      transmit buffer queue pointer."*/ //page 468
    GMAC->TBQB = (uint32) tx_descriptor_list;
    /*5. The transmit circuits can then be enabled by writing to the Network Control register.*/ //468
    GMAC->NCR |= 1<<TXEN;
    return OPERATION_SUCCESS;
}


/*this function configures the MAC and PHY layer of the SAME54P20A and LAN867x - PHY*/
uint8 gmac_config(
        uint32 num_of_rxbuffers, uint32 num_of_txbuffers,
        uint8 addresses[4][6], uint8 node_id, uint8 nodes,
        uint8 totime, uint8 burstcount, uint8 bursttimer) //TODO: ganz schön viele argumente, evtl. ist es besser das in ganze
                                                          //durch ein config-struct zu übergeben
{
    /*TODO: Clocks
 The GMAC peripheral relies on a system clock from the Main Clock Controller (MCLK) for register
 access and GMAC MCK.*/ //<--finde noch heraus wie du die GMAC MCK konfigurierst, das MLCK - module scheint die clocks für die 
    //peripherals zu kontrollieren, siehe 159, Figure 15-2, weiterhin 139 GLCK, scheinen die einzigen zwei möglichen quellen zu sein,
    /* All peripherals are composed of one digital bus interface connected to the APB or AHB bus and
 running from a corresponding clock in the Main Clock domain, and one peripheral core running
 from the peripheral Generic Clock (GCLK).*/ // siehe 134
    //allerdings scheint es hier nirgenwo eine möglichkeit zu geben, den takt des GMAC zu kontrollieren, siehe Table 14-9
    // Figure 13-1 auf seite 132 zeigt auch nochmal welche clocks in welche peripherals fließen und welche clocks welcher perihperals
    // ob wenn ja wie durch MLCK und GLCK gesteuert werden. interessant ist hier auch zu sehen das das GMAC nochmal zwei externe clocks
    //einfließen
    //TODO: vll noch sachen wie half duplex, full duplex über die argumente im gmac einstellen
    uint8 op_res;
    op_res = mclk_enable_peripheral_clock(GMAC); //enables access to GMAC registers, see [1, pp. 133,176/177, 442, Figure 24-1]
    port_set_rmii_pins();
    gmac_reset();
    op_res |= LAN867x_init(node_id, nodes, totime, burstcount, bursttimer); //TODO: die gmac_config funktion könnte generischer gemacht werden, wenn die Phy init 
    op_res |= gmac_config_receive_buffers(num_of_rxbuffers);                //funktion davor aufgerufen wird, damit wird sie unabhängig vom phy
    op_res |= gmac_config_transmit_buffers(num_of_txbuffers);               //Nein, die addressen der PHY register, sowie clause 22 übertragung sind 
    op_res |= gmac_config_address_registers(addresses);                     //IEEE genormt, d.h. könnte sein das es passt, schau mal ob du nur clause 22
                                                                            //register initilisieren musst, wenn nicht musst aufrgund der besonderen art
                                                                            //wie clause 45 register auf dem Lan867x angesprochen werden, das generischer machen
    const uint8 own_mac_addr[6] = {0x00, 0x04, 0x25, 0x1C, 0xa0, 0x02}; //TODO: das hier noch über den funktionsparameter übergeben
    op_res |= gmac_set_macaddress(own_mac_addr);
    gmac_set_interrupts();
    //TODO: enable interrupts
    return op_res;
}

void gmac_set_interrupts() {
    //see page 501
    GMAC->IER |= (1<<6);
    GMAC->IER |= (1<<11);
    GMAC->IER |= (1<<TCOMP);
    GMAC->IER |= (1<<20);
    GMAC->IER |= (1<<RCOMP);
    GMAC->IER |= (1<<18);
    GMAC->IER |= (1<<22);
    GMAC->IER |= (1<<19);
    GMAC->IER |= (1<<24);
    
}

//this function set the mac address of the board
uint8 gmac_set_macaddress(const uint8_t * pMacAddr)
{   //see page 511, 512
    GMAC->SAB0 = (pMacAddr[3] << 24)
                  | (pMacAddr[2] << 16)
                  | (pMacAddr[1] <<  8)
                  | (pMacAddr[0]);

    GMAC->SAT0 = (pMacAddr[5] <<  8)| (pMacAddr[4]) ;
    return OPERATION_SUCCESS;
}


uint8 gmac_config_address_registers(uint8 addresses[4][6]) {
    //TODO: vll. noch einstellen, das man über funktionsparameter der GMAC init funktion festlegen kann welche frame
    //addressen ins memory kopiert werden, der funktion noch nen besseren namen geben, wie gmac_config_MAC_filter odersowas
    /*This function shall determine which frames of the received frames shall be passed onto the 
     onto the FIFO Interface and thus consequently copied to memory via DMA, see [1, p. 456, 24.6.7 MAC Filtering Block]*/
     /*"The GMAC register pair hash address and the four Specific Address register pairs must be written
     with the required values. Each register pair comprises of a bottom register and top register, with the
     bottom register being written first. The address matching is disabled for a particular register pair
     after the bottom register has been written and re-enabled when the top register is written. Each
     register pair may be written at any time, regardless of whether the receive circuits are enabled or
     disabled"*/ //see page 468
    //TODO: finde heraus welches register die eigene mac-addresse setzt und schreibe dann eine funktion die diese gezielt setzt
    //siehe hierzu "sachen die es bei GMAC programmierung zu beachten gibt", da steht die funktion drin des microchip treibers
    for (int j=0; j<4; ++j) {
        GMAC->SAB0 |= addresses[0][j] << j;
    }
    GMAC->SAT0 |= addresses[0][4];
    GMAC->SAT0 |= addresses[0][5] << 1;
    
    for (int j=0; j<4; ++j) {
        GMAC->SAB1 |= addresses[1][j] << j;
    }
    GMAC->SAT1 |= addresses[1][4];
    GMAC->SAT1 |= addresses[1][5] << 1;
    
    for (int j=0; j<4; ++j) {
        GMAC->SAB2 |= addresses[2][j] << j;
    }
    GMAC->SAT2 |= addresses[2][4];
    GMAC->SAT2 |= addresses[2][5] << 1;
    
    for (int j=0; j<4; ++j) {
        GMAC->SAB3 |= addresses[3][j] << j;
    }
    GMAC->SAT3 |= addresses[3][4];
    GMAC->SAT3 |= addresses[3][5] << 1;
    /*The contents of each type ID register (when enabled) are compared against the length/type ID of the
      frame being received (e.g., bytes 13 and 14 in non-VLAN and non-SNAP encapsulated frames) and
      copied to memory if a match is found. [1, p. 456]*/
    //GMAC->TIDM0 |= (1<<31)|0xF788;//[1, p. 514] 0x88F7 = PTP 1588v2 Ethernet Frame
    GMAC->TIDM1 |= (1<<31)|0x88F7;//[1, p. 514] 0x88F7 = PTP 1588v2 Ethernet Frame
    GMAC->TIDM2 |= (1<<31)|0x887F;//[1, p. 514] 0x88F7 = PTP 1588v2 Ethernet Frame
    GMAC->TIDM3 |= (1<<31)|0x7F88;//[1, p. 514] 0x88F7 = PTP 1588v2 Ethernet Frame
    //initialize the hash pair address registeres
    //skipping
    return OPERATION_SUCCESS;
}

void take_timestamp(volatile timestamp* messpunkt) {
    //check if overflow occurred while measurement was taken, if so, correct the s_low value
    messpunkt->ns = GMAC->TN & 0x3FFFFFFF; //[1, p. 579]
    messpunkt->s_low = GMAC->TSL;  //[1, p. 576]
    volatile uint32 tn = GMAC->TN & 0x3FFFFFFF;
    volatile uint32 s_low = GMAC->TSL & 0x3FFFFFFF;
    if ((s_low == messpunkt->s_low) && (messpunkt->ns>tn)) messpunkt->s_low -= 1;
}

uint8 gmac_send_frame(uint8 *frame, uint16 length) { 

    take_timestamp(&tx_op_descr_queue[next_tx_op_idx].TS_MAC);
    uint8 op_res = OPERATION_SUCCESS;
    if (length >= (1<<14)) return 1; //length field in 14 bits, see [1, p. 449, Table 24-3]    
    if (buffer_space == 0) return 2;
    buffer_descriptor* current_descriptor = &tx_descriptor_list[use_next];
    //memcpy((void*)&tx_frame_buffer[1526*use_next], (const void*)frame, length);
    //current_descriptor->word_0 = (uint32)&tx_frame_buffer[1526*use_next];  
    current_descriptor->word_0 = (uint32)frame;  
    current_descriptor->word_1 = length | (1<<15); //set length and mark it as the last buffer [1, p. 449, Table 24-3]
    if (use_next == MAX_PACKET_QUEUE_IDX-1) current_descriptor->word_1 |= (1<<30);    
    if (++tx_queue_idx == MAX_PACKET_QUEUE_IDX) tx_queue_idx = 0;
    if (++use_next == MAX_DESCR_LIST_IDX) use_next = 0; //MAX_DESCR_LIST_IDX
    GMAC->NCR |= (1 << TSTART);
    if (use_next==0) GMAC->NCR |= (1 << THALT);
    if (GMAC->TSR & ~((1<<5)|(1<<3)|(1<<0))) op_res |= 4;
    --buffer_space;
    return op_res;
}

