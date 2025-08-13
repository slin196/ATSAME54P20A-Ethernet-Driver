/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 */

#include <port.h>

void port_set_rmii_pins() {
/* By default each pin is controlled by the PORT as a general purpose I/O, and alternatively it can be
 assigned to one of the peripheral functions: A, B, C, D, E, F, G, H, I, J, K, L, M or N. To enable a
 peripheral function on a pin, the Peripheral Multiplexer Enable bit in the Pin Configuration register
 corresponding to that pin (PINCFGn.PMUXEN, n = 0-31) in the PORT must be written to '1'.*/ //see page 30
 
//see page 442 Table 24-1 and page 30 Table 6-1
    PORT->GROUP0.PINCFG[12] |= 1<<MUXEN;  //set RXD[1]/GRX[1]
    PORT->GROUP0.PINCFG[13] |= 1<<MUXEN;  //set RXD[0]/GRX[0]
    PORT->GROUP0.PINCFG[14] |= 1<<MUXEN;  //set REFCK/GTXCK
    PORT->GROUP0.PINCFG[15] |= 1<<MUXEN;  //set RXER/GRXER
    PORT->GROUP0.PINCFG[17] |= 1<<MUXEN;  //set TXEN/GTXEN
    PORT->GROUP0.PINCFG[18] |= 1<<MUXEN;  //set TXD[0]/GTX[0]
    PORT->GROUP0.PINCFG[19] |= 1<<MUXEN;  //set TXD[1]/GTX[1]
    PORT->GROUP2.PINCFG[20] |= 1<<MUXEN;  //set CRSDV/GRXDV
    PORT->GROUP2.PINCFG[22] |= 1<<MUXEN;  //set MDC/GMDC
    PORT->GROUP2.PINCFG[23] |= 1<<MUXEN;  //set MDIO/GMDIO
 /*The selection of peripheral functions, A to N, is done by writing to the Peripheral Multiplexing Odd and
 Even bits in the Peripheral Multiplexing register (PMUXn.PMUXE/O) of the PORT. The table below
 describes the peripheral signals multiplexed to the PORT I/O pins.*/ //see page 30
    PORT->GROUP0.PMUX[6] |= 0xB << PMUXE;  //0xB corresponds to function "L" which corresponds to GMAC, see page 30 and 839
    PORT->GROUP0.PMUX[6] |= 0xB << PMUXO;  //set RXD[0]/GRX[0]
    PORT->GROUP0.PMUX[7] |= 0xB << PMUXE;  //set REFCK/GTXCK
    PORT->GROUP0.PMUX[7] |= 0xB << PMUXO;  //set RXER/GRXER
    PORT->GROUP0.PMUX[8] |= 0xB << PMUXO;  //set TXEN/GTXEN
    PORT->GROUP0.PMUX[9] |= 0xB << PMUXE;  //set TXD[0]/GTX[0]
    PORT->GROUP0.PMUX[9] |= 0xB << PMUXO;  //set TXD[1]/GTX[1]
    PORT->GROUP2.PMUX[10] |=0xB << PMUXE;  //set CRSDV/GRXDV
    PORT->GROUP2.PMUX[11] |=0xB << PMUXE;  //set MDC/GMDC
    PORT->GROUP2.PMUX[11] |=0xB << PMUXO;  //set MDIO/GMDIO
}

//prepares the GLCK_IO[1] pin to be used for glck generator 1 as clock source
void port_set_glck_io1() {
    //PB15 is GLCK_IO[1], see page 31
    //TODO: wenn du das hier als input setzt solltest du in PINCFG evtl. noch PULLEN entsprechen setzen
    //TODO: du willst ja den pin später lesen, dafür musst du vll. noch INEN auf 1 setzen
    PORT->GROUP1.DIR &= ~(0<<15);   //PB15 must be set as input, see page 140, Table 14-1 and page 825
    PORT->GROUP1.PINCFG[15] |= 1<<1;
    //enable for peripheral use
    PORT->GROUP1.PINCFG[15] |= 1<<MUXEN;  //see page 841
    PORT->GROUP1.PMUX[7] |= 0xC << PMUXO; //0xC corresponds to function "M" which corresponds to GLCK_IO, see page 30 and 839
}

void port_set_PB16_asoutput() {
    PORT->GROUP1.DIR |= (1 << 16); // see page 825
}

void port_set_PB28_asoutput() {
    PORT->GROUP1.DIR |= (1 << 28); // see page 825
}

void port_set_PB24_asoutput() {
    PORT->GROUP1.DIR |= (1 << 24);
}

void port_set_PB30_asoutput() {
    PORT->GROUP1.DIR |= (1 << 30);
}

