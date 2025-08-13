

#ifndef _NODE_SETTINGS_H    /* Guard against multiple inclusion */
#define _NODE_SETTINGS_H 

#ifdef __cplusplus
extern "C" {
#endif

#define NODE_ID            (0)
#define MAC_ADDRESS       
#define NUM_OF_TASKS       2
#define TASK_1_PERIOD_MS      1ull
#define TASK_1_STARTUPTIME 50
#define TASK_2_PERIOD_MS      56ull
#define TASK_2_STARTUPTIME 50
#define TASK_3_PERIOD_MS     56
#define TASK_3_STARTUPTIME 50ull
#define TASK_4_PERIOD_MS      56
#define TASK_4_STARTUPTIME 50ull
#define TASK_5_PERIOD_MS      56
#define TASK_5_STARTUPTIME 50ull
#define TASK_6_PERIOD_MS      56
#define TASK_6_STARTUPTIME 50ull
#define TASK_7_PERIOD_MS      56
#define TASK_7_STARTUPTIME 50ull
#define TASK_8_PERIOD_MS      56
#define TASK_8_STARTUPTIME 50ull

#define MS_TO_NS 1000000ull    
    
#define TASK_1_PERIOD ((TASK_1_PERIOD_MS)*(MS_TO_NS))
#define TASK_2_PERIOD ((TASK_2_PERIOD_MS)*(MS_TO_NS))
#define TASK_3_PERIOD ((TASK_3_PERIOD_MS)*(MS_TO_NS))
#define TASK_4_PERIOD ((TASK_4_PERIOD_MS)*(MS_TO_NS))
#define TASK_5_PERIOD ((TASK_5_PERIOD_MS)*(MS_TO_NS))
#define TASK_6_PERIOD ((TASK_6_PERIOD_MS)*(MS_TO_NS))
#define TASK_7_PERIOD ((TASK_4_PERIOD_MS)*(MS_TO_NS))
#define TASK_8_PERIOD ((TASK_5_PERIOD_MS)*(MS_TO_NS))
#define TASK_9_PERIOD ((TASK_6_PERIOD_MS)*(MS_TO_NS))       
    
#define TASK_1_PAYLOAD     70
#define TASK_2_PAYLOAD     1504
#define TASK_3_PAYLOAD     1504
#define TASK_4_PAYLOAD     565
#define TASK_5_PAYLOAD     565
#define TASK_6_PAYLOAD     565
#define TASK_7_PAYLOAD     565
#define TASK_8_PAYLOAD     565
    
#define BURSTMODE          0
#define BURSTCOUNT         0
#define BURSTTIME          0

//#define HARDWARE_SYNCH 
    
#ifdef __cplusplus
}
#endif

#endif