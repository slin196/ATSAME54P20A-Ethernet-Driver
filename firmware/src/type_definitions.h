
#ifndef _TYPE_DEFINITIONS_H    /* Guard against multiple inclusion */
#define _TYPE_DEFINITIONS_H


#ifdef __cplusplus
extern "C" {
#endif

#include <sys/types.h>
   
#define OPERATION_FAILURE 1
#define OPERATION_SUCCESS 0

typedef u_int32_t uint32;
typedef u_int16_t uint16;
typedef u_int8_t uint8;

typedef struct {
    volatile uint32 seconds_high;
    volatile uint32 seconds_low;
    volatile uint32 nanoseconds;
    volatile uint8  ov_flag;
} tsu_timestamp;

#ifdef __cplusplus
}
#endif

#endif 
