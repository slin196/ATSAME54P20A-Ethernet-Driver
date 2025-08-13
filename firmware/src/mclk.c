/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 */

#include "mclk.h"

#define ENABLE_APBA_PER(nr) (MCLK->APBAMASK |= 1<<nr)
#define ENABLE_APBB_PER(nr) (MCLK->APBBMASK |= 1<<nr)
#define ENABLE_APBC_PER(nr) (MCLK->APBCMASK |= 1<<nr)
#define ENABLE_APBD_PER(nr) (MCLK->APBDMASK |= 1<<nr)


//TODO: schau ob du hier noch so eine art MLCK_init bzw. config funktion erstellen musst, schau dir dazu nochmal die 
//CPUDIV und HSDIV register an

//TODO: ahb-mask noch abdecken, sind zwar default maßig alle auf eins aber vll doch noch eine funktion implementieren

//this function enables register access of a peripheral
uint8 mclk_enable_peripheral_clock(volatile void* peripheral) {
    /* The MCLK generates and controls the synchronous clocks on the system. This includes the
    CPU, bus clocks (APB, AHB) as well as the synchronous (to the CPU) user interfaces of the
    peripherals. It contains clock masks that can turn on/off the user interface of a peripheral as
    well as prescalers for the CPU and bus clocks.*/ //see page 133
    /*When the APB clock is not provided to a module, its registers cannot be read or written.*/ //see page 161
    uintptr_t per_addr = (uintptr_t) peripheral;
    if (per_addr<0x41000000)      return _mclk_enable_apba_peripheral(per_addr);
    else if (per_addr<0x42000000) return _mclk_enable_apbb_peripheral(per_addr);
    else if (per_addr<0x43000000) return _mclk_enable_apbc_peripheral(per_addr);
    else if (per_addr<0x44000000) return _mclk_enable_apbd_peripheral(per_addr);
    return OPERATION_FAILURE; // WRONG ADDRESS
}

uint8 _mclk_enable_apba_peripheral(uintptr_t per_addr) {
    switch(per_addr) {
        case 0x40000000: ENABLE_APBA_PER(0);  break; //PAC peripheral, see page 47 and 172
        case 0x40000400: ENABLE_APBA_PER(1);  break; //PM peripheral, see page 47 and 172
        case 0x40000800: ENABLE_APBA_PER(2);  break; //MLCK peripheral, see page 47 and 172
        case 0x40000C00: ENABLE_APBA_PER(3);  break; //RSTC peripheral, see page 47 and 172
        case 0x40001000: ENABLE_APBA_PER(4);  break; //OSCCTRL peripheral, see page 47 and 172
        case 0x40001400: ENABLE_APBA_PER(5);  break; //OSC32KCTRL peripheral, see page 47 and 172
        case 0x40001800: ENABLE_APBA_PER(6);  break; //SUPC peripheral, see page 47 and 172
        case 0x40001C00: ENABLE_APBA_PER(7);  break; //GCLK, see page 47 and 172
        case 0x40002000: ENABLE_APBA_PER(8);  break; //WDT, see page 47 and 172
        case 0x40002400: ENABLE_APBA_PER(9);  break; //RTC, see page 47 and 172
        case 0x40002800: ENABLE_APBA_PER(10); break; //EIC, see page 47 and 172
        case 0x40002C00: ENABLE_APBA_PER(11); break; //FREQM, see page 47 and 172
        case 0x40003000: ENABLE_APBA_PER(12); break; //SERCOM0, see page 47 and 172
        case 0x40003400: ENABLE_APBA_PER(13); break; //SERCOM1, see page 47 and 172
        case 0x40003800: ENABLE_APBA_PER(14); break; //TC0, see page 47 and 172
        case 0x40003C00: ENABLE_APBA_PER(15); break; //TC1, see page 47 and 172
        default:
            return OPERATION_FAILURE; //false peripheral address
    }
    return OPERATION_SUCCESS; 
}


uint8 _mclk_enable_apbb_peripheral(uintptr_t per_addr) {
    switch(per_addr) {
        case 0x41000000: ENABLE_APBB_PER(0);  break; //USB peripheral, see page 47 and 174
        case 0x41002000: ENABLE_APBB_PER(1);  break; //DSU peripheral, see page 47 and 174
        case 0x41004000: ENABLE_APBB_PER(2);  break; //NVMCTRL peripheral, see page 47 and 174
        case 0x41006000: break; //reserved bit, see page 47 and 174
        case 0x41008000: ENABLE_APBB_PER(4);  break; //PORT peripheral, see page 47 and 174
        case 0x4100A000: break; //reserved bit, see page 47 and 174
        case 0x4100C000: return OPERATION_SUCCESS; //RESERVED, see page 47
        case 0x4100E000: ENABLE_APBB_PER(7);  break; //GCLK, see page 47 and 174
        case 0x41010000: return OPERATION_SUCCESS; //RESERVED, see page 47
        case 0x41012000: ENABLE_APBB_PER(9);  break; //...
        case 0x41014000: ENABLE_APBB_PER(10); break; 
        case 0x41016000: ENABLE_APBB_PER(11); break; 
        case 0x41018000: ENABLE_APBB_PER(12); break; 
        case 0x4101A000: ENABLE_APBB_PER(13); break; 
        case 0x4101C000: ENABLE_APBB_PER(14); break; 
        case 0x4101E000: return 0; //RESERVED, see page 47
        case 0x41020000: ENABLE_APBB_PER(16); break; 
        default:
            return OPERATION_FAILURE; //FAILURE 
    }
    return OPERATION_SUCCESS;
}

uint8 _mclk_enable_apbc_peripheral(uintptr_t per_addr) {
    switch(per_addr) {
        case 0x42000000: break; //see page 47 and 176
        case 0x42000400: break; //see page 47 and 176
        case 0x42000800: ENABLE_APBC_PER(2);  break; //GMAC peripheral, see page 47 and 176
        case 0x42000C00: ENABLE_APBC_PER(3);  break; //TCC2 peripheral, see page 47 and 176
        case 0x42001000: ENABLE_APBC_PER(4);  break; //TCC3 peripheral, see page 47 and 176
        case 0x42001400: ENABLE_APBC_PER(5);  break; //...
        case 0x42001800: ENABLE_APBC_PER(6);  break; 
        case 0x42001C00: ENABLE_APBC_PER(7);  break; 
        case 0x42002000: ENABLE_APBC_PER(8);  break; 
        case 0x42002400: ENABLE_APBC_PER(9);  break; 
        case 0x42002800: ENABLE_APBC_PER(10); break; 
        case 0x42002C00: ENABLE_APBC_PER(11); break; 
        case 0x42003000: break; //reserved bit, see page 176
        case 0x42003400: ENABLE_APBC_PER(13); break; 
        case 0x42003800: ENABLE_APBC_PER(14); break; 
        default:
            return OPERATION_FAILURE; //FAILURE 
    }
    return OPERATION_SUCCESS;
}

uint8 _mclk_enable_apbd_peripheral(uintptr_t per_addr) {
      switch(per_addr) {
        case 0x43000000: ENABLE_APBD_PER(0);  break; //SERCOM4 peripheral, see page 47 and 178
        case 0x43000400: ENABLE_APBD_PER(1);  break; //SERCOM5 peripheral, see page 47 and 178
        case 0x43000800: ENABLE_APBD_PER(2);  break; //SERCOM6 peripheral, see page 47 and 178
        case 0x43000C00: ENABLE_APBD_PER(3);  break; //...
        case 0x43001000: ENABLE_APBD_PER(4);  break; 
        case 0x43001400: ENABLE_APBD_PER(5);  break; 
        case 0x43001800: ENABLE_APBD_PER(6);  break;
        case 0x43001C00: ENABLE_APBD_PER(7);  break; 
        case 0x43002000: ENABLE_APBD_PER(8);  break; 
        case 0x43002400: ENABLE_APBD_PER(9);  break;
        case 0x43002800: ENABLE_APBD_PER(10); break; 
        case 0x43002C00: ENABLE_APBD_PER(11); break; 
        default:
            return OPERATION_FAILURE; //FAILURE 
    }
    return OPERATION_SUCCESS;
}