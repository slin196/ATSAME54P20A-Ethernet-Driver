
/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 *SAM D5x/E5x Family Datasheet will be referenced as [1], i.e. IEEE citation style
 */

/*code and comments are based on the Cortex-M4 Technical Reference Manual.
 *I used the pdf-version provided by ARM. A website-version of the manual can be accessed via this link:
 * https://developer.arm.com/documentation/100166/0001
 *The pdf-manual will be referenced as [2], i.e. IEEE citation style
 */

#include "type_definitions.h"

#define NVIC ((volatile nvic_registers*) (0xE000E004)) //[2, p. 64]

//see [2, p. 64] and https://developer.arm.com/documentation/100166/0001/Nested-Vectored-Interrupt-Controller/NVIC-programmers-model/Table-of-NVIC-registers
typedef struct {
    uint32 ICTR;
    uint32 RESERVED0[62U];
    uint32 ISER[8U];              
    uint32 RESERVED1[24U];
    uint32 ICER[8U];             
    uint32 RESERVED2[24U];
    uint32 ISPR[8U];               
    uint32 RESERVED3[24U];
    uint32 ICPR[8U];               
    uint32 RESERVED4[24U];
    uint32 IABR[8U];               
    uint32 RESERVED5[56U];
    uint32 IPR[60U];               
} nvic_registers;


/*SAME54P20A specific Interrupt Numbers [1, p. 58 Table 10-1]*/
typedef enum IRQn
{
/******  CORTEX-M4 Processor Exceptions Numbers ******************************/
  Reset_IRQn                = -15, /* -15 Reset Vector, invoked on Power up and warm reset */
  NonMaskableInt_IRQn       = -14, /* -14 Non maskable Interrupt, cannot be stopped or preempted */
  HardFault_IRQn            = -13, /* -13 Hard Fault, all classes of Fault    */
  MemoryManagement_IRQn     = -12, /* -12 Memory Management, MPU mismatch, including Access Violation and No Match */
  BusFault_IRQn             = -11, /* -11 Bus Fault, Pre-Fetch-, Memory Access Fault, other address/memory related Fault */
  UsageFault_IRQn           = -10, /* -10 Usage Fault, i.e. Undef Instruction, Illegal State Transition */
  SVCall_IRQn               =  -5, /* -5  System Service Call via SVC instruction */
  DebugMonitor_IRQn         =  -4, /* -4  Debug Monitor                       */
  PendSV_IRQn               =  -2, /* -2  Pendable request for system service */
  SysTick_IRQn              =  -1, /* -1  System Tick Timer                   */

  PM_IRQn                   =   0, /* 0   Power Manager (PM)                  */
  MCLK_IRQn                 =   1, /* 1   Main Clock (MCLK)                   */
  OSCCTRL_XOSC0_IRQn        =   2, /* 2   Oscillators Control (OSCCTRL)       */
  OSCCTRL_XOSC1_IRQn        =   3, /* 3   Oscillators Control (OSCCTRL)       */
  OSCCTRL_DFLL_IRQn         =   4, /* 4   Oscillators Control (OSCCTRL)       */
  OSCCTRL_DPLL0_IRQn        =   5, /* 5   Oscillators Control (OSCCTRL)       */
  OSCCTRL_DPLL1_IRQn        =   6, /* 6   Oscillators Control (OSCCTRL)       */
  OSC32KCTRL_IRQn           =   7, /* 7   32kHz Oscillators Control (OSC32KCTRL) */
  SUPC_OTHER_IRQn           =   8, /* 8   Supply Controller (SUPC)            */
  SUPC_BODDET_IRQn          =   9, /* 9   Supply Controller (SUPC)            */
  WDT_IRQn                  =  10, /* 10  Watchdog Timer (WDT)                */
  RTC_IRQn                  =  11, /* 11  Real-Time Counter (RTC)             */
  EIC_EXTINT_0_IRQn         =  12, /* 12  External Interrupt Controller (EIC) */
  EIC_EXTINT_1_IRQn         =  13, /* 13  External Interrupt Controller (EIC) */
  EIC_EXTINT_2_IRQn         =  14, /* 14  External Interrupt Controller (EIC) */
  EIC_EXTINT_3_IRQn         =  15, /* 15  External Interrupt Controller (EIC) */
  EIC_EXTINT_4_IRQn         =  16, /* 16  External Interrupt Controller (EIC) */
  EIC_EXTINT_5_IRQn         =  17, /* 17  External Interrupt Controller (EIC) */
  EIC_EXTINT_6_IRQn         =  18, /* 18  External Interrupt Controller (EIC) */
  EIC_EXTINT_7_IRQn         =  19, /* 19  External Interrupt Controller (EIC) */
  EIC_EXTINT_8_IRQn         =  20, /* 20  External Interrupt Controller (EIC) */
  EIC_EXTINT_9_IRQn         =  21, /* 21  External Interrupt Controller (EIC) */
  EIC_EXTINT_10_IRQn        =  22, /* 22  External Interrupt Controller (EIC) */
  EIC_EXTINT_11_IRQn        =  23, /* 23  External Interrupt Controller (EIC) */
  EIC_EXTINT_12_IRQn        =  24, /* 24  External Interrupt Controller (EIC) */
  EIC_EXTINT_13_IRQn        =  25, /* 25  External Interrupt Controller (EIC) */
  EIC_EXTINT_14_IRQn        =  26, /* 26  External Interrupt Controller (EIC) */
  EIC_EXTINT_15_IRQn        =  27, /* 27  External Interrupt Controller (EIC) */
  FREQM_IRQn                =  28, /* 28  Frequency Meter (FREQM)             */
  NVMCTRL_0_IRQn            =  29, /* 29  Non-Volatile Memory Controller (NVMCTRL) */
  NVMCTRL_1_IRQn            =  30, /* 30  Non-Volatile Memory Controller (NVMCTRL) */
  DMAC_0_IRQn               =  31, /* 31  Direct Memory Access Controller (DMAC) */
  DMAC_1_IRQn               =  32, /* 32  Direct Memory Access Controller (DMAC) */
  DMAC_2_IRQn               =  33, /* 33  Direct Memory Access Controller (DMAC) */
  DMAC_3_IRQn               =  34, /* 34  Direct Memory Access Controller (DMAC) */
  DMAC_OTHER_IRQn           =  35, /* 35  Direct Memory Access Controller (DMAC) */
  EVSYS_0_IRQn              =  36, /* 36  Event System Interface (EVSYS)      */
  EVSYS_1_IRQn              =  37, /* 37  Event System Interface (EVSYS)      */
  EVSYS_2_IRQn              =  38, /* 38  Event System Interface (EVSYS)      */
  EVSYS_3_IRQn              =  39, /* 39  Event System Interface (EVSYS)      */
  EVSYS_OTHER_IRQn          =  40, /* 40  Event System Interface (EVSYS)      */
  PAC_IRQn                  =  41, /* 41  Peripheral Access Controller (PAC)  */
  RAMECC_IRQn               =  45, /* 45  RAM ECC (RAMECC)                    */
  SERCOM0_0_IRQn            =  46, /* 46  Serial Communication Interface (SERCOM0) */
  SERCOM0_1_IRQn            =  47, /* 47  Serial Communication Interface (SERCOM0) */
  SERCOM0_2_IRQn            =  48, /* 48  Serial Communication Interface (SERCOM0) */
  SERCOM0_OTHER_IRQn        =  49, /* 49  Serial Communication Interface (SERCOM0) */
  SERCOM1_0_IRQn            =  50, /* 50  Serial Communication Interface (SERCOM1) */
  SERCOM1_1_IRQn            =  51, /* 51  Serial Communication Interface (SERCOM1) */
  SERCOM1_2_IRQn            =  52, /* 52  Serial Communication Interface (SERCOM1) */
  SERCOM1_OTHER_IRQn        =  53, /* 53  Serial Communication Interface (SERCOM1) */
  SERCOM2_0_IRQn            =  54, /* 54  Serial Communication Interface (SERCOM2) */
  SERCOM2_1_IRQn            =  55, /* 55  Serial Communication Interface (SERCOM2) */
  SERCOM2_2_IRQn            =  56, /* 56  Serial Communication Interface (SERCOM2) */
  SERCOM2_OTHER_IRQn        =  57, /* 57  Serial Communication Interface (SERCOM2) */
  SERCOM3_0_IRQn            =  58, /* 58  Serial Communication Interface (SERCOM3) */
  SERCOM3_1_IRQn            =  59, /* 59  Serial Communication Interface (SERCOM3) */
  SERCOM3_2_IRQn            =  60, /* 60  Serial Communication Interface (SERCOM3) */
  SERCOM3_OTHER_IRQn        =  61, /* 61  Serial Communication Interface (SERCOM3) */
  SERCOM4_0_IRQn            =  62, /* 62  Serial Communication Interface (SERCOM4) */
  SERCOM4_1_IRQn            =  63, /* 63  Serial Communication Interface (SERCOM4) */
  SERCOM4_2_IRQn            =  64, /* 64  Serial Communication Interface (SERCOM4) */
  SERCOM4_OTHER_IRQn        =  65, /* 65  Serial Communication Interface (SERCOM4) */
  SERCOM5_0_IRQn            =  66, /* 66  Serial Communication Interface (SERCOM5) */
  SERCOM5_1_IRQn            =  67, /* 67  Serial Communication Interface (SERCOM5) */
  SERCOM5_2_IRQn            =  68, /* 68  Serial Communication Interface (SERCOM5) */
  SERCOM5_OTHER_IRQn        =  69, /* 69  Serial Communication Interface (SERCOM5) */
  SERCOM6_0_IRQn            =  70, /* 70  Serial Communication Interface (SERCOM6) */
  SERCOM6_1_IRQn            =  71, /* 71  Serial Communication Interface (SERCOM6) */
  SERCOM6_2_IRQn            =  72, /* 72  Serial Communication Interface (SERCOM6) */
  SERCOM6_OTHER_IRQn        =  73, /* 73  Serial Communication Interface (SERCOM6) */
  SERCOM7_0_IRQn            =  74, /* 74  Serial Communication Interface (SERCOM7) */
  SERCOM7_1_IRQn            =  75, /* 75  Serial Communication Interface (SERCOM7) */
  SERCOM7_2_IRQn            =  76, /* 76  Serial Communication Interface (SERCOM7) */
  SERCOM7_OTHER_IRQn        =  77, /* 77  Serial Communication Interface (SERCOM7) */
  CAN0_IRQn                 =  78, /* 78  Control Area Network (CAN0)         */
  CAN1_IRQn                 =  79, /* 79  Control Area Network (CAN1)         */
  USB_OTHER_IRQn            =  80, /* 80  Universal Serial Bus (USB)          */
  USB_SOF_HSOF_IRQn         =  81, /* 81  Universal Serial Bus (USB)          */
  USB_TRCPT0_IRQn           =  82, /* 82  Universal Serial Bus (USB)          */
  USB_TRCPT1_IRQn           =  83, /* 83  Universal Serial Bus (USB)          */
  GMAC_IRQn                 =  84, /* 84  Ethernet MAC (GMAC)                 */
  TCC0_OTHER_IRQn           =  85, /* 85  Timer Counter Control (TCC0)        */
  TCC0_MC0_IRQn             =  86, /* 86  Timer Counter Control (TCC0)        */
  TCC0_MC1_IRQn             =  87, /* 87  Timer Counter Control (TCC0)        */
  TCC0_MC2_IRQn             =  88, /* 88  Timer Counter Control (TCC0)        */
  TCC0_MC3_IRQn             =  89, /* 89  Timer Counter Control (TCC0)        */
  TCC0_MC4_IRQn             =  90, /* 90  Timer Counter Control (TCC0)        */
  TCC0_MC5_IRQn             =  91, /* 91  Timer Counter Control (TCC0)        */
  TCC1_OTHER_IRQn           =  92, /* 92  Timer Counter Control (TCC1)        */
  TCC1_MC0_IRQn             =  93, /* 93  Timer Counter Control (TCC1)        */
  TCC1_MC1_IRQn             =  94, /* 94  Timer Counter Control (TCC1)        */
  TCC1_MC2_IRQn             =  95, /* 95  Timer Counter Control (TCC1)        */
  TCC1_MC3_IRQn             =  96, /* 96  Timer Counter Control (TCC1)        */
  TCC2_OTHER_IRQn           =  97, /* 97  Timer Counter Control (TCC2)        */
  TCC2_MC0_IRQn             =  98, /* 98  Timer Counter Control (TCC2)        */
  TCC2_MC1_IRQn             =  99, /* 99  Timer Counter Control (TCC2)        */
  TCC2_MC2_IRQn             = 100, /* 100 Timer Counter Control (TCC2)        */
  TCC3_OTHER_IRQn           = 101, /* 101 Timer Counter Control (TCC3)        */
  TCC3_MC0_IRQn             = 102, /* 102 Timer Counter Control (TCC3)        */
  TCC3_MC1_IRQn             = 103, /* 103 Timer Counter Control (TCC3)        */
  TCC4_OTHER_IRQn           = 104, /* 104 Timer Counter Control (TCC4)        */
  TCC4_MC0_IRQn             = 105, /* 105 Timer Counter Control (TCC4)        */
  TCC4_MC1_IRQn             = 106, /* 106 Timer Counter Control (TCC4)        */
  TC0_IRQn                  = 107, /* 107 Basic Timer Counter (TC0)           */
  TC1_IRQn                  = 108, /* 108 Basic Timer Counter (TC1)           */
  TC2_IRQn                  = 109, /* 109 Basic Timer Counter (TC2)           */
  TC3_IRQn                  = 110, /* 110 Basic Timer Counter (TC3)           */
  TC4_IRQn                  = 111, /* 111 Basic Timer Counter (TC4)           */
  TC5_IRQn                  = 112, /* 112 Basic Timer Counter (TC5)           */
  TC6_IRQn                  = 113, /* 113 Basic Timer Counter (TC6)           */
  TC7_IRQn                  = 114, /* 114 Basic Timer Counter (TC7)           */
  PDEC_OTHER_IRQn           = 115, /* 115 Quadrature Decodeur (PDEC)          */
  PDEC_MC0_IRQn             = 116, /* 116 Quadrature Decodeur (PDEC)          */
  PDEC_MC1_IRQn             = 117, /* 117 Quadrature Decodeur (PDEC)          */
  ADC0_OTHER_IRQn           = 118, /* 118 Analog Digital Converter (ADC0)     */
  ADC0_RESRDY_IRQn          = 119, /* 119 Analog Digital Converter (ADC0)     */
  ADC1_OTHER_IRQn           = 120, /* 120 Analog Digital Converter (ADC1)     */
  ADC1_RESRDY_IRQn          = 121, /* 121 Analog Digital Converter (ADC1)     */
  AC_IRQn                   = 122, /* 122 Analog Comparators (AC)             */
  DAC_OTHER_IRQn            = 123, /* 123 Digital-to-Analog Converter (DAC)   */
  DAC_EMPTY_0_IRQn          = 124, /* 124 Digital-to-Analog Converter (DAC)   */
  DAC_EMPTY_1_IRQn          = 125, /* 125 Digital-to-Analog Converter (DAC)   */
  DAC_RESRDY_0_IRQn         = 126, /* 126 Digital-to-Analog Converter (DAC)   */
  DAC_RESRDY_1_IRQn         = 127, /* 127 Digital-to-Analog Converter (DAC)   */
  I2S_IRQn                  = 128, /* 128 Inter-IC Sound Interface (I2S)      */
  PCC_IRQn                  = 129, /* 129 Parallel Capture Controller (PCC)   */
  AES_IRQn                  = 130, /* 130 Advanced Encryption Standard (AES)  */
  TRNG_IRQn                 = 131, /* 131 True Random Generator (TRNG)        */
  ICM_IRQn                  = 132, /* 132 Integrity Check Monitor (ICM)       */
  PUKCC_IRQn                = 133, /* 133 PUblic-Key Cryptography Controller (PUKCC) */
  QSPI_IRQn                 = 134, /* 134 Quad SPI interface (QSPI)           */
  SDHC0_IRQn                = 135, /* 135 SD/MMC Host Controller (SDHC0)      */
  SDHC1_IRQn                = 136, /* 136 SD/MMC Host Controller (SDHC1)      */

  PERIPH_MAX_IRQn           = 136  /* Max peripheral ID */
} IRQn_Type;