/*code and comments are based on the SAM D5x/E5x Family Datasheet of Microchip.
 *There are different versions, i used the 2024 document. Available via this link: 
 *https://ww1.microchip.com/downloads/aemDocuments/documents/MCU32/ProductDocuments/DataSheets/SAM-D5x-E5x-Family-Data-Sheet-DS60001507.pdf
 */

#include "mclk.h"
#include "node_settings.h"
#include "type_definitions.h"
#include "tc.h"
#include "glck.h"

void TC0_Handler(void) {
    TC0->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC0, TASK_1_PERIOD);
    TC0->INTENCLR |= (1 << 4)|(1 << 0); // TODO: Evtl. denn cc0 compare interrupt ungetastet lassen und dann pakete über die
                                        //interrupts anstatt über polling versenden
}

void TC1_Handler(void) {
    TC1->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC1, TASK_2_PERIOD);
    TC1->INTENCLR |= (1 << 4)|(1 << 0); 
}

void TC2_Handler(void) {
    TC2->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC2, TASK_3_PERIOD);
    TC2->INTENCLR |= (1 << 4)|(1 << 0); 
}

void TC3_Handler(void) {
    TC3->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC3, TASK_4_PERIOD);
    TC3->INTENCLR |= (1 << 4)|(1 << 0); 
}

void TC4_Handler(void) {
    TC4->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC4, TASK_5_PERIOD);
    TC4->INTENCLR |= (1 << 4)|(1 << 0); 
}

void TC5_Handler(void) {
    TC5->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC5, TASK_6_PERIOD);
    TC5->INTENCLR |= (1 << 4)|(1 << 0); 
}

void TC6_Handler(void) {
    TC6->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC6, TASK_7_PERIOD);
    TC6->INTENCLR |= (1 << 4)|(1 << 0); 
}


void TC7_Handler(void) {
    TC7->INTFLAG |= (1<<4)|(1 << 0);
    tc_set_period_hw_update(TC7, TASK_8_PERIOD);
    TC7->INTENCLR |= (1 << 4)|(1 << 0); 
}

uint8 tc_set_period(volatile tc_registers* tc, uint16 per_in_ms) { //leg noch über funktionsparameter fest welche TC damit konfiguriert wird, hier ist fix der TC0
    //GCLK_TCx clock increments the counter is set from GCLK_MAIN //see page 1598, 48.6.2.3 
    /* The counter in the TC can either count events from the Event System, or clock ticks of the GCLK_TCx
 clock, which may be divided by the prescaler.*/ //page 1597
    //now lets set top 
    //tc->CTRLBSET |= 1<<LUPD; //see page 1618, Lock
    //while(tc->SYNCBUSY & (1<<CTRLB)); //wait for synchronisation completion
    //TODO: assuming where using the 32768 kHZ osci and set the PRESCALER BITS to 4, make it more generic/flexible!!!!!
    uint16 top = ((32768*per_in_ms)/1000)-1; //(f^(-1))*cc0 = period <=> cc0 = f*period
                                             //f = GCLK_TC0/(2^PRESCALER)
    //TODO geht das vll. auch mit code der ein bissl einfacher ist?
    tc->CTRLBSET |= (1<<LUPD);
    while(tc->SYNCBUSY & (1<<CTRLB));
    tc->COUNT16.CCBUF0 = top;
    while(tc->SYNCBUSY & (1<<STATUS_bit));
    tc->CTRLBSET |= 0x3 << CMD;         //Issue CMD command (CTRLBSET.CMD = command), see page 1618
    while(tc->SYNCBUSY & (1<<CTRLB));   //Wait for CMD synchronization (SYNCBUSY.CTRLB = 0), see page 1618
    while(tc->CTRLBSET & (0x3 << CMD)); //Wait for CMD read back as zero (CTRLBSET.CMD = 0), see page 1618
    tc->STATUS |= (1 << CCBUFV0);
    while(tc->SYNCBUSY & (1<<STATUS_bit));
    tc->CTRLBCLR |= (1<<LUPD);
    while(tc->SYNCBUSY & (1<<CTRLB));
    while(tc->SYNCBUSY & (1<<CC0_bit)); // wait till synchronization is complete: page 1629 
    /*TODO: sicher, das du den 32bit modus nehmen willst? der 32 bit modus wird dadurch erreicht, das zwei 16 bit timer peripherals zusammengelegt
    werden, d.h. die anzahl der verfügbaren TCs halbiert sich, siehe seite 1598: " 32-bit mode is achieved by pairing two 16-bit TC peripherals. TC0 is paired with TC1,
    TC2 is paired with TC3. TC4, TC5, TC6 and TC7 cannot be paired.
    When paired, the TC peripherals are configured using the registers of the even-numbered TC.
    The TC bus clocks (CLK_TCx_APB) for both Host and Client TCs need to be enabled.
    The odd-numbered partner will act as a Client, and the Client bit in the Status register
    (STATUS.Client) will be set. "*/
    /*d.h. halbiert man hier die anzahl der möglichen tasks, ohne eine genauere zeitliche aufläsung zu erreichen, wird die zeitliche auflösung
     überhaupt mit größerem timer genauer, hängt vll. allein vom prescaler ab*/
    return OPERATION_SUCCESS;
}

uint8 tc_set_period_hw_update(volatile tc_registers* tc, uint16 per_in_ms) { //leg noch über funktionsparameter fest welche TC damit konfiguriert wird, hier ist fix der TC0
    //GCLK_TCx clock increments the counter is set from GCLK_MAIN //see page 1598, 48.6.2.3 
    /* The counter in the TC can either count events from the Event System, or clock ticks of the GCLK_TCx
 clock, which may be divided by the prescaler.*/ //page 1597
    //TODO: assuming where using the 32768 kHZ osci and set the PRESCALER BITS to 4, make it more generic/flexible!!!!!
    uint16 top = ((32768*per_in_ms)/1000)-1; //(f^(-1))*cc0 = period <=> cc0 = f*period
                                             //f = GCLK_TC0/(2^PRESCALER)
    /*if (TC0->CTRLBSET &= (1<<LUPD)) { //LUPD is set, clear LUPD bit, so cc0 receives new value on update condition, see page 1617
        TC0->CTRLBSET |= (1<<LUPD);
        while(TC0->SYNCBUSY & (1<<CTRLB));
    }*/
    tc->COUNT16.CCBUF0 = top;
    while(tc->SYNCBUSY & (1<<STATUS_bit));
    return OPERATION_SUCCESS;
}

void tc_start(volatile tc_registers* tc) {
    tc->CTRLA |= 1<<ENABLE; //nun fängt der counter an hochzuzählens
    while(tc->SYNCBUSY&(1<<ENABLE));
}

void tc_start_tcs() {
#ifdef TASK_1_PERIOD
    tc_start(TC0);
#endif
#ifdef TASK_2_PERIOD
    tc_start(TC1);
#endif
#ifdef TASK_3_PERIOD
    tc_start(TC2);
#endif
#ifdef TASK_4_PERIOD
    tc_start(TC3);
#endif
#ifdef TASK_5_PERIOD
    tc_start(TC4);
#endif
#ifdef TASK_6_PERIOD
    tc_start(TC5);
#endif
#ifdef TASK_7_PERIOD
    tc_start(TC6);
#endif    
#ifdef TASK_8_PERIOD
    tc_start(TC7);
#endif
}

uint8 tc_config_tcs() {
    uint8 op_res = OPERATION_SUCCESS;
#ifdef TASK_1_PERIOD
    op_res |= tc_config(TC0, TASK_1_STARTUPTIME);
#endif
#ifdef TASK_2_PERIOD
    op_res |= tc_config(TC1, TASK_2_STARTUPTIME);
#endif
#ifdef TASK_3_PERIOD
    op_res |= tc_config(TC2, TASK_3_STARTUPTIME);
#endif
#ifdef TASK_4_PERIOD
    op_res |= tc_config(TC3, TASK_4_STARTUPTIME);
#endif
#ifdef TASK_5_PERIOD
    op_res |= tc_config(TC4, TASK_5_STARTUPTIME);
#endif
#ifdef TASK_6_PERIOD
    op_res |= tc_config(TC5, TASK_6_STARTUPTIME);
#endif
#ifdef TASK_7_PERIOD
    op_res |= tc_config(TC6, TASK_7_STARTUPTIME);
#endif
#ifdef TASK_8_PERIOD
    op_res |= tc_config(TC7, TASK_8_STARTUPTIME);
#endif
    return op_res;
}

uint8 tc_config(volatile tc_registers* tc, uint32 period) {
    uint8 op_res;
    /*48.6.2.1 Initialization
    The following registers are enable-protected, meaning that they can only be written when the TC is
    disabled (CTRLA.ENABLE =0):
    Control A register (CTRLA), except the Enable (ENABLE) and Software Reset (SWRST) bits
    Drive Control register (DRVCTRL)
    Wave register (WAVE)
    Event Control register (EVCTRL)*/ //page 1597
    /*Before enabling the TC, the peripheral must be configured by the following steps:
    1. Enable the TC bus clock (CLK_TCx_APB).*/ //page 1597
    op_res = mclk_enable_peripheral_clock(tc);
    op_res |= glck_config(5, tc, OSC32K); //TODO: vll. noch die clock nicht fix machen sondern als funktionsparameter über tc_config eingeben
    //TODO: die clock sollte über den externen oszillator bezogen werden und dieser auf eine 32kHz frequenz runtergescaled werden.
    //Vorgehen: einen Generator auswählen, (vorsicht wenn du Generator 0 nimmst, hier nicht seinen 
    //prescaler nutzen um auf 32k runterzuscalen, weil du sonst die frequenz der MCLK 
    //veränderst-->wenn auf der generator ebene prescalest anderen generator nehmen) )
    //TODO: ist der OSCUL32K von der auflösung her wirklich fein genug, evtl. nich einen mit einer besseren auflösung nehmen
    tc->CTRLA &= ~(1<<ENABLE); //clear enable bit
    while(tc->SYNCBUSY&(1<<ENABLE)); //wait for write synchronisation to complete
    tc->DBGCTRL = 1;
    /*2. Select 8-, 16- or 32-bit counter mode via the TC Mode bit group in the Control A register
    (CTRLA.MODE). The default mode is 16-bit.*/
    tc->CTRLA |= 0x0 << MODE; //TODO: entscheide dich noch für den richtigen modus, das hier sind 16 bit
    /*3. Select one wave generation operation in the Waveform Generation Operation bit group in the
    WAVE register (WAVE.WAVEGEN).*/
    tc->WAVE = MFRQ; //enables CC0 to be TOP, see page 1626
    /*4. If desired, the GCLK_TCx clock can be prescaled via the Prescaler bit group in the Control A
    register (CTRLA.PRESCALER).? If the prescaler is used, select a prescaler synchronization operation via the Prescaler and
    Counter Synchronization bit group in the Control A register (CTRLA.PRESYNC).
    Timer/Counter (TC)*/
    tc->CTRLA |= 0x0 << PRESCALER; //=GCLK_TC0/(2^5)  TODO: ist das richtig so, nicht das dann der counter zu schnell hochzählt und die maximal mögliche
    //periodendauer dann zu kurz ist
    //TODO: keep in mind: max_period = mode * f^(-1) <=> f = mode/max_period
    //tc->CTRLA |= 0x1 << PRESCSYNC; //TODO: das hier noch ausklammern, wenn du den prescaler wirklich nicht benutzt
    /*5. If desired, select one-shot operation by writing a '1' to the One-Shot bit in the Control B Set
    register (CTRLBSET.ONESHOT).*/
    tc->INTENSET |= 1<<0; //enable compare interrupt with compare register 0
    /*6. If desired, configure the counting direction 'down' (starting from the TOP value) by writing a '1' to
    the Counter Direction bit in the Control B register (CTRLBSET.DIR).*/

    /*7. For capture operation, enable the individual channels to capture in the Capture Channel x
    Enable bit group in the Control A register (CTRLA.CAPTEN).*/
    
    /*When starting the TC, the COUNT value will be either ZERO or TOP (depending
      on the counting direction set by CTRLBSET.DIR or CTRLBCLR.DIR), */ //1599
    
    //5 ist noch ausgewählt weil in dem PLIB file alle anderen channels belegt sind, ändern!!!
    /*8. If desired, enable inversion of the waveform output or IO pin input signal for individual channels
    via the Invert Enable bit group in the Drive Control register (DRVCTRL.INVEN).*/
    op_res |= tc_set_period(tc, period);
    //configure the inturrupt controller NVIC weil die interrupt request lines des TC an ihn gebunden sind
    return op_res;
}

//debug functions
uint16 read_counter(volatile tc_registers* tc) {
    tc->CTRLBSET |= 0x4 << CMD;
    while(tc->SYNCBUSY & (1<<CTRLB));
    volatile uint16 count = tc->COUNT16.COUNT;
    return count;
}

uint16 read_intflag(volatile tc_registers* tc) {
    volatile uint16 intflag = tc->INTFLAG;
    return intflag;
}

uint16 read_cc0(volatile tc_registers* tc) {
    volatile uint16 count = tc->COUNT16.CC0;
    return count;
}

uint16 read_ctrla(volatile tc_registers* tc) {
    volatile uint16 count = tc->CTRLA;
    return count;
}
