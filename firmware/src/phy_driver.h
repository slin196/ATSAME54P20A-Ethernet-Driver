
/*code and comments are based on the LAN8670/1/2 Datasheet of Microchip aka. the "10BASE-T1S Ethernet PHY Transceiver Product Brief"
 *There are different versions, i used the 2025 document. Download via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/AIS/ProductDocuments/DataSheets/LAN8670-1-2-Data-Sheet-60001573.pdf
 *the LAN8670/1/2 Datasheet will be cited as [2], i.e. IEEE citation style
 */


#ifndef _PHY_DRIVER_H
#define _PHY_DRIVER_H //header guard

#define IDLE             0x4

#define OP_WRITE         0x1
#define OP_READ          0x2
#define BITMASK_5(reg)   (reg & 0x1F)
#define WTN              0x2
#define CLTTO            30
#define PHYA             0x0 //assuming phy is initialised with phy address 0

#define BASIC_CONTROL    0x0
#define BASIC_STATUS     0x1
#define PHY_ID0          0x2
#define PHY_ID1          0x3

#define MMDCTRL          0xD //0xD = Address of MMD Access Control Register
#define MMDAD            0xE

//PMA/PMD register addresses, [2, page 73]
#define T1PMAPMDEXTA     0x12
#define T1PMAPMDCTL      0x834
#define T1SPMACTL        0x8F9
#define T1SPMASTS        0x8FA
#define T1STSTCTL        0x8FB

//PCS register addresses, [2, page 80]
#define T1SPCSCTL        0x8F3
#define T1SPCSSTS        0x8F4
#define T1SPCSDIAG1      0x8F5
#define T1SPCSDIAG2      0x8F6

//Miscellaneous register addresses, [2, page 85], still incomplete
#define CTRL1            0x10
#define STS1             0x18
#define STS2             0x19
#define STS3             0x1A
#define IMSK1            0x1C
#define IMSK2            0x1D
#define CDCTL0           0x87
#define PLCA_CTRL0       0xCA01
#define PLCA_CTRL1       0xCA02
#define PLCA_TOTMR       0xCA04
#define PLCA_BURST       0xCA05

uint8 LAN867x_init(uint8, uint8, uint8, uint8, uint8);
void LAN867x_write22(uint32, uint16);
uint8 LAN867x_write45(uint16, uint16);
uint16 LAN867x_read22(uint32);
uint8 LAN867x_read45(uint16, uint16*);

#endif