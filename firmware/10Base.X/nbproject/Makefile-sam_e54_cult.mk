#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-sam_e54_cult.mk)" "nbproject/Makefile-local-sam_e54_cult.mk"
include nbproject/Makefile-local-sam_e54_cult.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sam_e54_cult
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/sam_e54_cult/peripheral/clock/plib_clock.c ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_e54_cult/peripheral/port/plib_port.c ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c ../src/config/sam_e54_cult/stdio/xc32_monitor.c ../src/config/sam_e54_cult/initialization.c ../src/config/sam_e54_cult/interrupts.c ../src/config/sam_e54_cult/exceptions.c ../src/config/sam_e54_cult/startup_xc32.c ../src/config/sam_e54_cult/libc_syscalls.c ../src/main.c ../src/port.c ../src/phy_driver.c ../src/mclk.c ../src/glck.c ../src/gmac.c ../src/ptp.c ../src/ethernet.c ../src/ptp_algo.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/49303614/plib_clock.o ${OBJECTDIR}/_ext/417231850/plib_cmcc.o ${OBJECTDIR}/_ext/417202121/plib_dmac.o ${OBJECTDIR}/_ext/125090035/plib_eic.o ${OBJECTDIR}/_ext/47154128/plib_evsys.o ${OBJECTDIR}/_ext/416895314/plib_nvic.o ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o ${OBJECTDIR}/_ext/416842163/plib_port.o ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o ${OBJECTDIR}/_ext/67477800/initialization.o ${OBJECTDIR}/_ext/67477800/interrupts.o ${OBJECTDIR}/_ext/67477800/exceptions.o ${OBJECTDIR}/_ext/67477800/startup_xc32.o ${OBJECTDIR}/_ext/67477800/libc_syscalls.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/port.o ${OBJECTDIR}/_ext/1360937237/phy_driver.o ${OBJECTDIR}/_ext/1360937237/mclk.o ${OBJECTDIR}/_ext/1360937237/glck.o ${OBJECTDIR}/_ext/1360937237/gmac.o ${OBJECTDIR}/_ext/1360937237/ptp.o ${OBJECTDIR}/_ext/1360937237/ethernet.o ${OBJECTDIR}/_ext/1360937237/ptp_algo.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/49303614/plib_clock.o.d ${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d ${OBJECTDIR}/_ext/417202121/plib_dmac.o.d ${OBJECTDIR}/_ext/125090035/plib_eic.o.d ${OBJECTDIR}/_ext/47154128/plib_evsys.o.d ${OBJECTDIR}/_ext/416895314/plib_nvic.o.d ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/416842163/plib_port.o.d ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d ${OBJECTDIR}/_ext/67477800/initialization.o.d ${OBJECTDIR}/_ext/67477800/interrupts.o.d ${OBJECTDIR}/_ext/67477800/exceptions.o.d ${OBJECTDIR}/_ext/67477800/startup_xc32.o.d ${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/port.o.d ${OBJECTDIR}/_ext/1360937237/phy_driver.o.d ${OBJECTDIR}/_ext/1360937237/mclk.o.d ${OBJECTDIR}/_ext/1360937237/glck.o.d ${OBJECTDIR}/_ext/1360937237/gmac.o.d ${OBJECTDIR}/_ext/1360937237/ptp.o.d ${OBJECTDIR}/_ext/1360937237/ethernet.o.d ${OBJECTDIR}/_ext/1360937237/ptp_algo.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/49303614/plib_clock.o ${OBJECTDIR}/_ext/417231850/plib_cmcc.o ${OBJECTDIR}/_ext/417202121/plib_dmac.o ${OBJECTDIR}/_ext/125090035/plib_eic.o ${OBJECTDIR}/_ext/47154128/plib_evsys.o ${OBJECTDIR}/_ext/416895314/plib_nvic.o ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o ${OBJECTDIR}/_ext/416842163/plib_port.o ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o ${OBJECTDIR}/_ext/67477800/initialization.o ${OBJECTDIR}/_ext/67477800/interrupts.o ${OBJECTDIR}/_ext/67477800/exceptions.o ${OBJECTDIR}/_ext/67477800/startup_xc32.o ${OBJECTDIR}/_ext/67477800/libc_syscalls.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/port.o ${OBJECTDIR}/_ext/1360937237/phy_driver.o ${OBJECTDIR}/_ext/1360937237/mclk.o ${OBJECTDIR}/_ext/1360937237/glck.o ${OBJECTDIR}/_ext/1360937237/gmac.o ${OBJECTDIR}/_ext/1360937237/ptp.o ${OBJECTDIR}/_ext/1360937237/ethernet.o ${OBJECTDIR}/_ext/1360937237/ptp_algo.o

# Source Files
SOURCEFILES=../src/config/sam_e54_cult/peripheral/clock/plib_clock.c ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/sam_e54_cult/peripheral/port/plib_port.c ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c ../src/config/sam_e54_cult/stdio/xc32_monitor.c ../src/config/sam_e54_cult/initialization.c ../src/config/sam_e54_cult/interrupts.c ../src/config/sam_e54_cult/exceptions.c ../src/config/sam_e54_cult/startup_xc32.c ../src/config/sam_e54_cult/libc_syscalls.c ../src/main.c ../src/port.c ../src/phy_driver.c ../src/mclk.c ../src/glck.c ../src/gmac.c ../src/ptp.c ../src/ethernet.c ../src/ptp_algo.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
_/_=\\
ShExtension=.bat
Device=ATSAME54P20A
ProjectDir="C:\Users\slin9\Desktop\BA\Project_folder\Versuchsaufbau Bachelorarbeit hoheBuslast\slave node_1\firmware\10Base.X"
ProjectName=getting_started_sam_e54_cult
ConfName=sam_e54_cult
ImagePath="dist\sam_e54_cult\${IMAGE_TYPE}\10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\sam_e54_cult\${IMAGE_TYPE}"
ImageName="10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif
MDFUHostPath="C:\Program Files\Microchip\MPLABX\v6.25\mplab_platform\mplab-pymdfu\bin\windows\pymdfu-bin.exe"
PYFWImageBuilderPath="C:\Program Files\Microchip\MPLABX\v6.25\mplab_platform\mplab-pymdfu\bin\windows\pyfwimagebuilder-bin.exe"

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-sam_e54_cult.mk ${DISTDIR}/10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: [rm -rf ${ProjectDir}/../../hex && mkdir ${ProjectDir}/../../hex && cp ${ProjectDir}/${ImagePath} ${ProjectDir}/../../hex/]"
	@rm -rf ${ProjectDir}/../../hex && mkdir ${ProjectDir}/../../hex && cp ${ProjectDir}/${ImagePath} ${ProjectDir}/../../hex/
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=ATSAME54P20A
MP_LINKER_FILE_OPTION=,--script="..\src\config\sam_e54_cult\ATSAME54P20A.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/49303614/plib_clock.o: ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c  .generated_files/flags/sam_e54_cult/67f96df80375265128bdccdf426555baa12cfb61 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/49303614" 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/49303614/plib_clock.o.d" -o ${OBJECTDIR}/_ext/49303614/plib_clock.o ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417231850/plib_cmcc.o: ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/sam_e54_cult/e9b02a786c9dbd8c4e6a83e741d982521b364ed6 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417231850" 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/417231850/plib_cmcc.o ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417202121/plib_dmac.o: ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c  .generated_files/flags/sam_e54_cult/a68982af770c9eeccde8e2abc3bd1bf4da15259c .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417202121" 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417202121/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/417202121/plib_dmac.o ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125090035/plib_eic.o: ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c  .generated_files/flags/sam_e54_cult/72e74a2853e83c8477595abfa9504565c0febb63 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125090035" 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125090035/plib_eic.o.d" -o ${OBJECTDIR}/_ext/125090035/plib_eic.o ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47154128/plib_evsys.o: ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c  .generated_files/flags/sam_e54_cult/b10881cf60bdff6fb47a3d8a67d7814f836326ed .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47154128" 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47154128/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/47154128/plib_evsys.o ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416895314/plib_nvic.o: ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e54_cult/2172c7b844fa7053ccf8421a6a41d122f89db900 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416895314" 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416895314/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/416895314/plib_nvic.o ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o: ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/sam_e54_cult/4f76d3ce5fa9f9effb6893a9498ded4653c2ce6a .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1320929860" 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416842163/plib_port.o: ../src/config/sam_e54_cult/peripheral/port/plib_port.c  .generated_files/flags/sam_e54_cult/19b1125a2067ad9ddddf6f2d8fb07c58469be532 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416842163" 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416842163/plib_port.o.d" -o ${OBJECTDIR}/_ext/416842163/plib_port.o ../src/config/sam_e54_cult/peripheral/port/plib_port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o: ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c  .generated_files/flags/sam_e54_cult/ab6383e5826a16f6a9951d8e764dedf76492bad2 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125102869" 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d" -o ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o: ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c  .generated_files/flags/sam_e54_cult/c52cb799370f783b7e371ef8a77aa2c549300fb6 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/666506505" 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d" -o ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o: ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c  .generated_files/flags/sam_e54_cult/5c50c45a61a7636859d17ac214458e2f6d4e6a0c .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1820158563" 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d" -o ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1841252638/xc32_monitor.o: ../src/config/sam_e54_cult/stdio/xc32_monitor.c  .generated_files/flags/sam_e54_cult/575a5d2495ad04654d47a7866922f7852652d508 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1841252638" 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o ../src/config/sam_e54_cult/stdio/xc32_monitor.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/initialization.o: ../src/config/sam_e54_cult/initialization.c  .generated_files/flags/sam_e54_cult/a12682725b980ebd28a3148d0a00925cce746869 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/initialization.o.d" -o ${OBJECTDIR}/_ext/67477800/initialization.o ../src/config/sam_e54_cult/initialization.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/interrupts.o: ../src/config/sam_e54_cult/interrupts.c  .generated_files/flags/sam_e54_cult/75287a62b0a076315ecee1ee6f1e943a4d45cfd7 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/interrupts.o.d" -o ${OBJECTDIR}/_ext/67477800/interrupts.o ../src/config/sam_e54_cult/interrupts.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/exceptions.o: ../src/config/sam_e54_cult/exceptions.c  .generated_files/flags/sam_e54_cult/a1713e2e3176f722ed6ecab3dbbe032b584cd33d .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/exceptions.o.d" -o ${OBJECTDIR}/_ext/67477800/exceptions.o ../src/config/sam_e54_cult/exceptions.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/startup_xc32.o: ../src/config/sam_e54_cult/startup_xc32.c  .generated_files/flags/sam_e54_cult/4c314f4283ac93d1cf3c1a6402ff302e2853ac44 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/67477800/startup_xc32.o ../src/config/sam_e54_cult/startup_xc32.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/libc_syscalls.o: ../src/config/sam_e54_cult/libc_syscalls.c  .generated_files/flags/sam_e54_cult/b7aeeeaee0b205fa69d5d722b9f3850bd14150d3 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/67477800/libc_syscalls.o ../src/config/sam_e54_cult/libc_syscalls.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e54_cult/5dae483f6c65a02e982c3b9782a896e600668449 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/port.o: ../src/port.c  .generated_files/flags/sam_e54_cult/c115b90fe3c7a54c0bdc4436cba4811358c4c961 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/port.o.d" -o ${OBJECTDIR}/_ext/1360937237/port.o ../src/port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/phy_driver.o: ../src/phy_driver.c  .generated_files/flags/sam_e54_cult/a79ff9201a59edda04ffcc591fc2b15064a71a02 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/phy_driver.o.d" -o ${OBJECTDIR}/_ext/1360937237/phy_driver.o ../src/phy_driver.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/mclk.o: ../src/mclk.c  .generated_files/flags/sam_e54_cult/54a1fafd67dbce94883aa2b5692a7a9484cc2175 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/mclk.o.d" -o ${OBJECTDIR}/_ext/1360937237/mclk.o ../src/mclk.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/glck.o: ../src/glck.c  .generated_files/flags/sam_e54_cult/fe01c2236663b1bb029cde1ce2e3caca377484f3 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/glck.o.d" -o ${OBJECTDIR}/_ext/1360937237/glck.o ../src/glck.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/gmac.o: ../src/gmac.c  .generated_files/flags/sam_e54_cult/523a0ee9d85b3b99d2bd2404b2bbd35387a4ab1c .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gmac.o.d" -o ${OBJECTDIR}/_ext/1360937237/gmac.o ../src/gmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp.o: ../src/ptp.c  .generated_files/flags/sam_e54_cult/c880d086e5bf7cecbe2b90cbb20325abd7a099a1 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ptp.o.d" -o ${OBJECTDIR}/_ext/1360937237/ptp.o ../src/ptp.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ethernet.o: ../src/ethernet.c  .generated_files/flags/sam_e54_cult/b4077087a125a722b4b91c04a05552bbed091249 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ethernet.o.d" -o ${OBJECTDIR}/_ext/1360937237/ethernet.o ../src/ethernet.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp_algo.o: ../src/ptp_algo.c  .generated_files/flags/sam_e54_cult/82e8d12b644a9a2d9363379910be7ed89ded5f45 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp_algo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp_algo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ptp_algo.o.d" -o ${OBJECTDIR}/_ext/1360937237/ptp_algo.o ../src/ptp_algo.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/49303614/plib_clock.o: ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c  .generated_files/flags/sam_e54_cult/d671109fb2267315d8226f0fc51e71374fa41df5 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/49303614" 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/49303614/plib_clock.o.d" -o ${OBJECTDIR}/_ext/49303614/plib_clock.o ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417231850/plib_cmcc.o: ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/sam_e54_cult/8b71697f262e7a5a89e4a899ea7999fae8677992 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417231850" 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/417231850/plib_cmcc.o ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417202121/plib_dmac.o: ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c  .generated_files/flags/sam_e54_cult/d463405db481b4b0e27dbb61b0458d30674b5c10 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417202121" 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417202121/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/417202121/plib_dmac.o ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125090035/plib_eic.o: ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c  .generated_files/flags/sam_e54_cult/38e5261671b168dbd239bbb261301a3642e296fc .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125090035" 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125090035/plib_eic.o.d" -o ${OBJECTDIR}/_ext/125090035/plib_eic.o ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47154128/plib_evsys.o: ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c  .generated_files/flags/sam_e54_cult/4e44d6498393b8a335f9299d3b40b9124d5dbbd2 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47154128" 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47154128/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/47154128/plib_evsys.o ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416895314/plib_nvic.o: ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e54_cult/883b26106c990754ddc6eab70aac651c3ad4eec6 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416895314" 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416895314/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/416895314/plib_nvic.o ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o: ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/sam_e54_cult/7d8ed6ebd63d4a92975735ccfc9096d4c8d2f115 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1320929860" 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416842163/plib_port.o: ../src/config/sam_e54_cult/peripheral/port/plib_port.c  .generated_files/flags/sam_e54_cult/1342166eaab5fb1bd36d0da21899294e70552aa4 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416842163" 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416842163/plib_port.o.d" -o ${OBJECTDIR}/_ext/416842163/plib_port.o ../src/config/sam_e54_cult/peripheral/port/plib_port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o: ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c  .generated_files/flags/sam_e54_cult/ca6297a4b3aae2ea1092bab97799e55603bf2958 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125102869" 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d" -o ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o: ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c  .generated_files/flags/sam_e54_cult/26d3b30035ef46799b56f07bbb52ed21a378d9f4 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/666506505" 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d" -o ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o: ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c  .generated_files/flags/sam_e54_cult/97d65b072e377ded5808478e0640184bc8d931fd .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1820158563" 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d" -o ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1841252638/xc32_monitor.o: ../src/config/sam_e54_cult/stdio/xc32_monitor.c  .generated_files/flags/sam_e54_cult/36304e189d605ef64b4a61815bd20a0d8cff5bef .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1841252638" 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o ../src/config/sam_e54_cult/stdio/xc32_monitor.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/initialization.o: ../src/config/sam_e54_cult/initialization.c  .generated_files/flags/sam_e54_cult/8a0783dabd1c6f8865181921fb23f94571070370 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/initialization.o.d" -o ${OBJECTDIR}/_ext/67477800/initialization.o ../src/config/sam_e54_cult/initialization.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/interrupts.o: ../src/config/sam_e54_cult/interrupts.c  .generated_files/flags/sam_e54_cult/d5ed64721231859bc328e7c32c6a0688bc77fe21 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/interrupts.o.d" -o ${OBJECTDIR}/_ext/67477800/interrupts.o ../src/config/sam_e54_cult/interrupts.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/exceptions.o: ../src/config/sam_e54_cult/exceptions.c  .generated_files/flags/sam_e54_cult/f23ee10990deb635af4e1be85dd52fd19151044e .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/exceptions.o.d" -o ${OBJECTDIR}/_ext/67477800/exceptions.o ../src/config/sam_e54_cult/exceptions.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/startup_xc32.o: ../src/config/sam_e54_cult/startup_xc32.c  .generated_files/flags/sam_e54_cult/5d85387002679730d59b3cd1011231bf8d145eb4 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/67477800/startup_xc32.o ../src/config/sam_e54_cult/startup_xc32.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/libc_syscalls.o: ../src/config/sam_e54_cult/libc_syscalls.c  .generated_files/flags/sam_e54_cult/b4b90007e440956d0d59fc7a31595747820be36b .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/67477800/libc_syscalls.o ../src/config/sam_e54_cult/libc_syscalls.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e54_cult/50c61a15161196a4c8b37687f4bdd104bd374889 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/port.o: ../src/port.c  .generated_files/flags/sam_e54_cult/c00507fef908dc75e5da9ba8cf286353d65b2441 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/port.o.d" -o ${OBJECTDIR}/_ext/1360937237/port.o ../src/port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/phy_driver.o: ../src/phy_driver.c  .generated_files/flags/sam_e54_cult/61c34d6e63605dad64db08aec25710b4a62b06ea .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/phy_driver.o.d" -o ${OBJECTDIR}/_ext/1360937237/phy_driver.o ../src/phy_driver.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/mclk.o: ../src/mclk.c  .generated_files/flags/sam_e54_cult/bce6bf65bbb18b3afbac045cd9712177196cbb83 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/mclk.o.d" -o ${OBJECTDIR}/_ext/1360937237/mclk.o ../src/mclk.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/glck.o: ../src/glck.c  .generated_files/flags/sam_e54_cult/8b6417c5475de3dd5ce63d2f3e89f2cc75df5654 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/glck.o.d" -o ${OBJECTDIR}/_ext/1360937237/glck.o ../src/glck.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/gmac.o: ../src/gmac.c  .generated_files/flags/sam_e54_cult/4595a7f257d95650c6f19aba35c5bbc356465d4d .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gmac.o.d" -o ${OBJECTDIR}/_ext/1360937237/gmac.o ../src/gmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp.o: ../src/ptp.c  .generated_files/flags/sam_e54_cult/6a754e8c1859cf0f90c530010d7aa5c61c1a8c3b .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ptp.o.d" -o ${OBJECTDIR}/_ext/1360937237/ptp.o ../src/ptp.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ethernet.o: ../src/ethernet.c  .generated_files/flags/sam_e54_cult/f27a7078020fae1bfb0685a7ce2c9ffe754fc136 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ethernet.o.d" -o ${OBJECTDIR}/_ext/1360937237/ethernet.o ../src/ethernet.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp_algo.o: ../src/ptp_algo.c  .generated_files/flags/sam_e54_cult/9b7d26594017673bdba6efd70c3d0dc12afe1f65 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp_algo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp_algo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ptp_algo.o.d" -o ${OBJECTDIR}/_ext/1360937237/ptp_algo.o ../src/ptp_algo.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/sam_e54_cult/ATSAME54P20A.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/10Base.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/sam_e54_cult/ATSAME54P20A.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/10Base.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/10Base.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
