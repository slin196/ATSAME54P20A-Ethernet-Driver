/* 
 * File:   ethernet_functions.h
 * Author: slin9
 *
 * Created on April 2, 2025, 6:41 PM
 */
#include <sys/types.h>

#ifndef ETHERNET_FUNCTIONS_H
#define	ETHERNET_FUNCTIONS_H //TODO: ist die header guard richtig implemetiert? ich siehe nicht nicht wie?

#ifdef	__cplusplus
extern "C" {
#endif

#define GMAC ((volatile gmac_registers*) (0x42000800)) //see IO-VIEW or PAGE 47
    
typedef u_int32_t uint32;
typedef u_int16_t uint16;
typedef u_int8_t uint8;

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
    //TODO: STILL IMPLEMENTED THE REST OF THE REGISTERS SEE PAGE 475/475 ff
} gmac_registers;

typedef struct {
    uint32 word_0;
    uint32 word_1;
} buffer_descriptor;
/*
uint8 gmac_init_config(void);
uint8 gmac_config_receive_buffers(uint32, uint32);
uint8 gmac_config_transmit_buffers(uint32, uint16);
uint8 gmac_config(uint32, uint32, uint32, uint16, mac_address*);
uint8 gmac_config_address_registers(mac_address*);
uint8 gmac_send_packet(uint8 *, uint32);
uint8 gmac_set_macaddress(const uint8_t *);
*/
#ifdef	__cplusplus
}
#endif

#endif	/* ETHERNET_FUNCTIONS_H */

