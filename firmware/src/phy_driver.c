
/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 *SAM D5x/E5x Family Datasheet will be referenced as [1], i.e. IEEE citation style
 */

/*code and comments are based on the LAN8670/1/2 Datasheet of Microchip aka.  "10BASE-T1S Ethernet PHY Transceiver LAN8670/1/2"
 *There are different versions, i used the 2025 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/AIS/ProductDocuments/DataSheets/LAN8670-1-2-Data-Sheet-60001573.pdf
 *the LAN8670/1/2 Datasheet will be referenced as [2], i.e. IEEE citation style
 */

#include <stdint.h>
#include "type_definitions.h"
#include "gmac.h"
#include "phy_driver.h"

//vll. noch den treiber in 2 weitere schichten aufteilen
//einen treiber der generell schreib operationen vornimmt und einen der dann die schreiboperationen vornimmt die 
//mechanismen nutzen die LAN8760 spezifisch sind, also die operationen LAN867x_write22 und LAN867x_read22
//sind eigentlich von jedem PHY gleich, nur die clause 45 operation ist nicht genormt und LAN8670 spezifisch

//clause 22 write operation to phy register
void LAN867x_write22(uint32 REGA, uint16 DATA) {
    GMAC->MAN = (1<<CLTTO)|(OP_WRITE << 28) |(PHYA << 23) | (REGA << 18) | (WTN << 16) | DATA; //see [1, page 504]
    while (!(GMAC->NSR & 0x4));
}

//clause 22 read operation to phy register
uint16 LAN867x_read22(uint32 REGA) {
    GMAC->MAN = (1<<CLTTO)|(OP_READ << 28) |(PHYA << 23) | (REGA << 18) | (WTN << 16); //see [1, page 504]
    while (!(GMAC->NSR & 0x4));
    return GMAC->MAN & 0xFFFF;
}

void LAN867x_op45_helper(uint16 mmd_address, uint16 REG, uint16* DATA, uint8 optype, uint8* op_result) {
    mmd_address &= 0x1F;
    /*MMD Register Read/MMD Register Write
    The following process is used to indirectly read/write Clause 45 registers using the Clause 22 access mechanism.
    1. Write the MMD Access Control register with the MMD Function (FNCTN) field set to 00b and the Device
    Address (DEVID) field with the MDIO Management Device (MMD) address.*/ //[2, page 30]
    LAN867x_write22(MMDCTRL, mmd_address); //FNCTN field of MMDCTRL is 0, due to mmd_address &= 0x1F; [2, page 70]
    //2. Write the address of the desired register to be written into the MMD Access Address/Data register. //[2, page 30]
    LAN867x_write22(MMDAD, REG);
    //3. Write the MMD Access Control register with the MMD Function field set to 01b, 10b, or 11b. //[2, page 30]
    LAN867x_write22(MMDCTRL, 0x1 << 14 | mmd_address); //0x1<<14 = setting the MMD Function field to Data [2,page 70]
    //now attain the data of clause45 register REG by reading the MMDAD register
    *op_result |= OPERATION_SUCCESS;
    if (optype == OP_WRITE) {
        //now write the data to be written to the clause 45 register into MMD Access Address/Data register
        LAN867x_write22(MMDAD, *DATA); 
        return;
    } else if (optype == OP_READ) {
        //now attain the data of clause45 register REG by reading the MMDAD register
        *DATA = LAN867x_read22(MMDAD); 
        return;
    }
    *op_result |= OPERATION_FAILURE;
}

void LAN867x_op45(uint16 REG, uint16 *data, uint8 optype, uint8* op_result) {
    /*"Clause 45 Register Access
    The LAN8670/1/2 only supports the MDIO management frame protocol defined in IEEE Std 802.3 Clause 22.
    Registers mapped into IEEE Std 802.3 Clause 45 MDIO Managed Devices (MMD) are accessed indirectly through
    the MMD Access Control (MMDCTRL) and MMD Access Address/Data (MMDAD) registers as described in IEEE Std
    802.3 Annex 22D."*/ //[2, page 30]
    switch(REG) {//TODO: theoretisch könnte man alle N registermakros auf die zahlen 1-N mappen. diese könnten dann als index in
                 //in einem array dienen, der die richtige registeraddresse zurückliefert, ab einem bestimmten index sind es 
                 //dann die PMA/PMD, register ab einem bestimmten dann wieder nur die miscealleanous register etc.
        case T1PMAPMDEXTA:;//the list of all PMA/PMD registers [2, page 73]
        case T1PMAPMDCTL:;
        case T1SPMACTL:;
        case T1SPMASTS:;
        case T1STSTCTL:
            LAN867x_op45_helper(0x1, REG, data, optype, op_result); //0x1 =  MDIO Manageable Device (MMD) address of  PMA/PMD registers, see page 40
            break; //DONE
        case T1SPCSCTL:; //the list of all PCS registers, [2, page 80]
        case T1SPCSSTS:;
        case T1SPCSDIAG1:;
        case T1SPCSDIAG2:
            LAN867x_op45_helper(0x3, REG, data, optype, op_result); //0x3 =  MDIO Manageable Device (MMD) address of PCS registers, see page 46
            break; //DONE
        case CTRL1:; //the list of all miscellaneous registers NOT YET, SEE TODOS!!!
        case STS1:;
        case STS2:; //TODO: implement the remaining miscellaneous statements as  cases
        case PLCA_CTRL0:; //TODO: implement the remaining miscellaneous statements as  cases
        case PLCA_CTRL1:; //TODO: implement the remaining miscellaneous statements as  cases
        case PLCA_TOTMR:; //TODO: implement the remaining miscellaneous statements as  cases
        case PLCA_BURST:;
        case CDCTL0:
            LAN867x_op45_helper(0x1F, REG, data, optype, op_result); //0x1F =  MDIO Manageable Device (MMD) address of miscellaneous registers
            break; //DONE
        default:
            *op_result |= OPERATION_FAILURE; //ERROR, non existing/not implemented register address
    }
}

uint8 LAN867x_write45(uint16 REG, uint16 data) {
    uint8 op_res = OPERATION_SUCCESS;
    LAN867x_op45(REG, &data, OP_WRITE, &op_res);
    return op_res;
}

uint8 LAN867x_read45(uint16 REG, uint16* data) {
    uint8 op_res = OPERATION_SUCCESS;
    LAN867x_op45(REG, data, OP_READ, &op_res);
    return op_res;
}

uint8 LAN867x_init(uint8 node_id, uint8 num_of_nodes, uint8 to_time, uint8 burst_count, uint8 burst_timer) {
    uint16 reg_read, reg_write;
    uint8 op_res = OPERATION_SUCCESS;
    GMAC->NCR |= (1<<MPE); //enables the MDIO pin of the rmii-interface for communication with the phy [1, pp. 480, 503]
    if (num_of_nodes <= node_id) op_res |= OPERATION_FAILURE; //the local node id must not be higher than the allowed number of nodes
    reg_write = (1 << 15);
    LAN867x_write22(BASIC_CONTROL, reg_write);
    reg_write = (1 << 15);// PLCA is enabled by setting the PLCA Enable bit in the PLCA Control 0 (PLCA_CTRL0) register. [2, p. 150]
    op_res |= LAN867x_write45(PLCA_CTRL0, reg_write);
    op_res |= LAN867x_read45(PLCA_CTRL0, &reg_read);
    op_res |= (reg_read != reg_write); //make sure write was executed correctly
    /* The node Local ID is configured within the PLCA Local ID (ID) field of 
    the PLCA Control 1 (PLCA_CTRL1) register and must be unique within the PLCA
    network segment to successfully avoid collisions.*/ //[2, p. 151]
    reg_write = node_id;
    /*When the node is configured as the PLCA coordinator, then the
      number of transmit opportunities within each PLCA bus cycle (period between successive BEACON transmissions) is
      configured in the Node Count (NCNT) field of the PLCA Control 1 register.*/
    if (node_id == 0) reg_write |= (num_of_nodes<<8); 
    op_res |= LAN867x_write45(PLCA_CTRL1, reg_write); //see [2, p. 151]
    op_res |= LAN867x_read45(PLCA_CTRL1, &reg_read);
    op_res |= (reg_read != reg_write); //make sure write was executed correctly
    
    //reg_write = (1 << 10);
    //op_res |= LAN867x_write45(T1SPMACTL, reg_write);
    //op_res |= LAN867x_read45(T1SPMACTL, &reg_read);
    //op_res |= (reg_read != reg_write); //make sure write was executed correctly
    
    /*reg_write = (0 << 15);
    op_res |= LAN867x_write45(CDCTL0, reg_write); //see [2, p. 141]
    op_res |= LAN867x_read45(CDCTL0, &reg_read);*/
    //op_res |= (reg_read != reg_write); //make sure write was executed correctly
     /*The time for each transmit opportunity is configured within the PLCA Transmit Opportunity Timer (PLCA_TOTMR)
      register. The transmit opportunity timer must be set equal among all nodes in the PLCA collision domain to maintain
      synchronization among the nodes. The default transmit opportunity timer value is appropriate for segments specified
      in IEEE 802.3 Clause 147 and should only be changed in special circumstances*/
    if (to_time) { //to_time == 0 shall indicate that the TO Time should not be changed (which is recommended, see comment above)
        to_time *= 10; //TODO: besser ist es das ganze in bits zu ermöglihcen.to_time shall be given in us. the register increments in 100ns, i.e. 0.1us. Therefore the multiplication by 10
        reg_write = to_time;
        op_res |= LAN867x_write45(PLCA_TOTMR, reg_write); //see [2, p. 153]
        op_res |= LAN867x_read45(PLCA_TOTMR, &reg_read);
        op_res |= (reg_read != reg_write);
    }
    //now lets configure the burst mode
    if (burst_count) { //see [2, p. 154]
        if (burst_timer) reg_write = (burst_count << 8) | burst_timer;
        else reg_write = (burst_count << 8) | (1 << 7); //1<<7 = default value for burst timer, see  //see [2, p. 154]
        op_res |= LAN867x_write45(PLCA_BURST, reg_write);
        op_res |= LAN867x_read45(PLCA_BURST, &reg_read);
        op_res |= (reg_read != reg_write);
    }
    return op_res;
}

