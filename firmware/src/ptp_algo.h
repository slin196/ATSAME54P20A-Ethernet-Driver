

#ifndef PTP_ALGO_H    /* Guard against multiple inclusion */
#define PTP_ALGO_H



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif
    
typedef struct
{
  uint16_t              secondsMsb;		// Some embedded HW implementations only
  uint32_t              secondsLsb;		// support a 32 bit counter for seconds
  uint32_t              nanoseconds;
  uint64_t              correctionField;
} timeStamp_t;

void reset();

void processSync_v1(ptp_header*);

uint8 processFollowUp_v1(ptp_header*);

int64_t P_regler();

int64_t I_regler();

int64_t D_regler();

uint64_t tsToInternal_v1(const timeStamp_t*);

void correct_clock();
                
void handlePtp_v1(uint8_t*, uint32_t, uint32_t);
 
#ifdef __cplusplus
}
#endif

#endif /*PTP_ALGO_H*/
