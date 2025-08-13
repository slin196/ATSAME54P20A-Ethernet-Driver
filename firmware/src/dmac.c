
#include "dmac.h"

#define DMAC                ((volatile dmac_registers*) (0x4100A000))
#define DMAENABLE            1

typedef struct {
    uint16 CTRL;
    uint16 CRCCTRL;
    uint32 CRCDATAIN;
} dmac_registers;


uint8 dmac_init() {
    DMAC->CTRL = 1 << DMAENABLE;
    return 0;
}