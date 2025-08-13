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
ProjectDir="C:\Users\slin9\Desktop\Project_folder\grundprojekt\firmware\10Base.X"
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
${OBJECTDIR}/_ext/49303614/plib_clock.o: ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c  .generated_files/flags/sam_e54_cult/2e06251f3b814d0a6f04132aaa6627b7bb2a3b6 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/49303614" 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/49303614/plib_clock.o.d" -o ${OBJECTDIR}/_ext/49303614/plib_clock.o ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417231850/plib_cmcc.o: ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/sam_e54_cult/adf9f8f9044742e009a98c7023653df66d3c7c8e .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417231850" 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/417231850/plib_cmcc.o ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417202121/plib_dmac.o: ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c  .generated_files/flags/sam_e54_cult/9020ea2cd70b38db85fa536d444eab6dbcc84dd .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417202121" 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417202121/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/417202121/plib_dmac.o ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125090035/plib_eic.o: ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c  .generated_files/flags/sam_e54_cult/df99bf50b26363dcf11b8dbdbbdd9a28da9dfa17 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125090035" 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125090035/plib_eic.o.d" -o ${OBJECTDIR}/_ext/125090035/plib_eic.o ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47154128/plib_evsys.o: ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c  .generated_files/flags/sam_e54_cult/c92d8107f3b60f29d29caea253849bf35a3848e5 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47154128" 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47154128/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/47154128/plib_evsys.o ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416895314/plib_nvic.o: ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e54_cult/379274854125a0764385ff60cf68418b9c62165f .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416895314" 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416895314/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/416895314/plib_nvic.o ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o: ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/sam_e54_cult/64b31f06264c6d4538b824b43627b10498a9e135 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1320929860" 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416842163/plib_port.o: ../src/config/sam_e54_cult/peripheral/port/plib_port.c  .generated_files/flags/sam_e54_cult/8399fdc396ed7e727e7ec833c180333621efebc0 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416842163" 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416842163/plib_port.o.d" -o ${OBJECTDIR}/_ext/416842163/plib_port.o ../src/config/sam_e54_cult/peripheral/port/plib_port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o: ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c  .generated_files/flags/sam_e54_cult/d7aa00cb44b901e910e87d96dd7a63252d97cca4 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125102869" 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d" -o ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o: ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c  .generated_files/flags/sam_e54_cult/fa159236ee65c897abb89a39f29595f00ad6ce94 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/666506505" 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d" -o ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o: ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c  .generated_files/flags/sam_e54_cult/512c9f5e6e8b3f053694d63845da14dfd57aeb45 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1820158563" 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d" -o ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1841252638/xc32_monitor.o: ../src/config/sam_e54_cult/stdio/xc32_monitor.c  .generated_files/flags/sam_e54_cult/b332a8dd5f8d4809371ff6f4ae81ab9dd7d83072 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1841252638" 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o ../src/config/sam_e54_cult/stdio/xc32_monitor.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/initialization.o: ../src/config/sam_e54_cult/initialization.c  .generated_files/flags/sam_e54_cult/6fdcd74970231c56c4a1c3411053202a4ef71413 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/initialization.o.d" -o ${OBJECTDIR}/_ext/67477800/initialization.o ../src/config/sam_e54_cult/initialization.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/interrupts.o: ../src/config/sam_e54_cult/interrupts.c  .generated_files/flags/sam_e54_cult/8ba39f5e614253d1e8bf48115ef6da63c2263c44 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/interrupts.o.d" -o ${OBJECTDIR}/_ext/67477800/interrupts.o ../src/config/sam_e54_cult/interrupts.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/exceptions.o: ../src/config/sam_e54_cult/exceptions.c  .generated_files/flags/sam_e54_cult/62e48ada69cd0fc873ff544f754a3724d1ab7cf1 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/exceptions.o.d" -o ${OBJECTDIR}/_ext/67477800/exceptions.o ../src/config/sam_e54_cult/exceptions.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/startup_xc32.o: ../src/config/sam_e54_cult/startup_xc32.c  .generated_files/flags/sam_e54_cult/ff1d87bd3cc3c1855f8f228095ccb3ad0950fb01 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/67477800/startup_xc32.o ../src/config/sam_e54_cult/startup_xc32.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/libc_syscalls.o: ../src/config/sam_e54_cult/libc_syscalls.c  .generated_files/flags/sam_e54_cult/77734dc1baade9b30ee513e814e329aed321db9c .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/67477800/libc_syscalls.o ../src/config/sam_e54_cult/libc_syscalls.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e54_cult/e5480d2fbcabbc9027be334808abe6a56e2cf241 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/port.o: ../src/port.c  .generated_files/flags/sam_e54_cult/6360eef973e35e63af816c75a19d1fa9f12a307b .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/port.o.d" -o ${OBJECTDIR}/_ext/1360937237/port.o ../src/port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/phy_driver.o: ../src/phy_driver.c  .generated_files/flags/sam_e54_cult/6b9da7b4f56b7a8d4723d21f7bf3d223a6f15d3d .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/phy_driver.o.d" -o ${OBJECTDIR}/_ext/1360937237/phy_driver.o ../src/phy_driver.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/mclk.o: ../src/mclk.c  .generated_files/flags/sam_e54_cult/6ef2a036a1e38a328b31b2922412b111f5125442 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/mclk.o.d" -o ${OBJECTDIR}/_ext/1360937237/mclk.o ../src/mclk.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/glck.o: ../src/glck.c  .generated_files/flags/sam_e54_cult/e865fcee4dafe56dfeacf71e1337185040ea66af .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/glck.o.d" -o ${OBJECTDIR}/_ext/1360937237/glck.o ../src/glck.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/gmac.o: ../src/gmac.c  .generated_files/flags/sam_e54_cult/35644bee122935eb197a46d8d45b7a926b57ff95 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gmac.o.d" -o ${OBJECTDIR}/_ext/1360937237/gmac.o ../src/gmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp.o: ../src/ptp.c  .generated_files/flags/sam_e54_cult/11b82778a73e7c517ef70e3835303a7dbd315398 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ptp.o.d" -o ${OBJECTDIR}/_ext/1360937237/ptp.o ../src/ptp.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ethernet.o: ../src/ethernet.c  .generated_files/flags/sam_e54_cult/f8a2953e9a7de8038abe8702335c10073659c432 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ethernet.o.d" -o ${OBJECTDIR}/_ext/1360937237/ethernet.o ../src/ethernet.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp_algo.o: ../src/ptp_algo.c  .generated_files/flags/sam_e54_cult/7323074192d0a2782f61285ff73460607227a929 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp_algo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp_algo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ptp_algo.o.d" -o ${OBJECTDIR}/_ext/1360937237/ptp_algo.o ../src/ptp_algo.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/49303614/plib_clock.o: ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c  .generated_files/flags/sam_e54_cult/f1a0237c03790d307e3925588c9acd60a96f9060 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/49303614" 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/49303614/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/49303614/plib_clock.o.d" -o ${OBJECTDIR}/_ext/49303614/plib_clock.o ../src/config/sam_e54_cult/peripheral/clock/plib_clock.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417231850/plib_cmcc.o: ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/sam_e54_cult/b372c307e22c9b0669d6953d5ceaf01943a7f9f3 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417231850" 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/417231850/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417231850/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/417231850/plib_cmcc.o ../src/config/sam_e54_cult/peripheral/cmcc/plib_cmcc.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/417202121/plib_dmac.o: ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c  .generated_files/flags/sam_e54_cult/20e718162c417f12c1bb709fc502efdfe8b0e378 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/417202121" 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/417202121/plib_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/417202121/plib_dmac.o.d" -o ${OBJECTDIR}/_ext/417202121/plib_dmac.o ../src/config/sam_e54_cult/peripheral/dmac/plib_dmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125090035/plib_eic.o: ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c  .generated_files/flags/sam_e54_cult/a91a2612919dc4602d98d9d81fac111d13836988 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125090035" 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/125090035/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125090035/plib_eic.o.d" -o ${OBJECTDIR}/_ext/125090035/plib_eic.o ../src/config/sam_e54_cult/peripheral/eic/plib_eic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/47154128/plib_evsys.o: ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c  .generated_files/flags/sam_e54_cult/edaa70e6ff5747de756d74a8fbdd3284437ba139 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/47154128" 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/47154128/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/47154128/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/47154128/plib_evsys.o ../src/config/sam_e54_cult/peripheral/evsys/plib_evsys.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416895314/plib_nvic.o: ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c  .generated_files/flags/sam_e54_cult/e7c21bc2f89d61c01b73e064a6ed019db753b600 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416895314" 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/416895314/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416895314/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/416895314/plib_nvic.o ../src/config/sam_e54_cult/peripheral/nvic/plib_nvic.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o: ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/sam_e54_cult/68d98ff689e25814d81cad004b17a4e6c9206c4 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1320929860" 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1320929860/plib_nvmctrl.o ../src/config/sam_e54_cult/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/416842163/plib_port.o: ../src/config/sam_e54_cult/peripheral/port/plib_port.c  .generated_files/flags/sam_e54_cult/7a61cfe92620c78c7507de76404c59953dbafeb8 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/416842163" 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/416842163/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/416842163/plib_port.o.d" -o ${OBJECTDIR}/_ext/416842163/plib_port.o ../src/config/sam_e54_cult/peripheral/port/plib_port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o: ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c  .generated_files/flags/sam_e54_cult/48fc4e77674d4aa37f33f3efd7b137c9d1e0a0db .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/125102869" 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o.d" -o ${OBJECTDIR}/_ext/125102869/plib_rtc_timer.o ../src/config/sam_e54_cult/peripheral/rtc/plib_rtc_timer.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o: ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c  .generated_files/flags/sam_e54_cult/f25ec92b875c27be392d566f746454f34a545de8 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/666506505" 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o.d" -o ${OBJECTDIR}/_ext/666506505/plib_sercom6_i2c_master.o ../src/config/sam_e54_cult/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o: ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c  .generated_files/flags/sam_e54_cult/801f6b354c10a39480430742a20fe83e6f65800d .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1820158563" 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o.d" -o ${OBJECTDIR}/_ext/1820158563/plib_sercom1_usart.o ../src/config/sam_e54_cult/peripheral/sercom/usart/plib_sercom1_usart.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1841252638/xc32_monitor.o: ../src/config/sam_e54_cult/stdio/xc32_monitor.c  .generated_files/flags/sam_e54_cult/b2f2dc9a0c4e042d478a7d50a3f3984a5a43d46d .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1841252638" 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1841252638/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1841252638/xc32_monitor.o ../src/config/sam_e54_cult/stdio/xc32_monitor.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/initialization.o: ../src/config/sam_e54_cult/initialization.c  .generated_files/flags/sam_e54_cult/59229b58a3b03e9f561b4863efc4af144f32578d .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/initialization.o.d" -o ${OBJECTDIR}/_ext/67477800/initialization.o ../src/config/sam_e54_cult/initialization.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/interrupts.o: ../src/config/sam_e54_cult/interrupts.c  .generated_files/flags/sam_e54_cult/6bb34748c70d8a3eef2ac9a6e6bd2bbd088a1c47 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/interrupts.o.d" -o ${OBJECTDIR}/_ext/67477800/interrupts.o ../src/config/sam_e54_cult/interrupts.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/exceptions.o: ../src/config/sam_e54_cult/exceptions.c  .generated_files/flags/sam_e54_cult/dbb55e8cfb52fee3f453e173ce0163195b1761f2 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/exceptions.o.d" -o ${OBJECTDIR}/_ext/67477800/exceptions.o ../src/config/sam_e54_cult/exceptions.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/startup_xc32.o: ../src/config/sam_e54_cult/startup_xc32.c  .generated_files/flags/sam_e54_cult/cf867e7a4f558dd7b4aae4c42142f1f1cdc9dd41 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/67477800/startup_xc32.o ../src/config/sam_e54_cult/startup_xc32.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/67477800/libc_syscalls.o: ../src/config/sam_e54_cult/libc_syscalls.c  .generated_files/flags/sam_e54_cult/8564630fa5fab68d1ce3380466ff8d432bee2587 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/67477800" 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/67477800/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/67477800/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/67477800/libc_syscalls.o ../src/config/sam_e54_cult/libc_syscalls.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/sam_e54_cult/a7892a0c5858fc300eaf7048027c7dad8d789667 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/port.o: ../src/port.c  .generated_files/flags/sam_e54_cult/984b726f4c3cff62ddc5273f910d9405ad63ed36 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/port.o.d" -o ${OBJECTDIR}/_ext/1360937237/port.o ../src/port.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/phy_driver.o: ../src/phy_driver.c  .generated_files/flags/sam_e54_cult/568c5c0d48c77d0fe5ef18e0ad1252ae33695195 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy_driver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/phy_driver.o.d" -o ${OBJECTDIR}/_ext/1360937237/phy_driver.o ../src/phy_driver.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/mclk.o: ../src/mclk.c  .generated_files/flags/sam_e54_cult/83793eed146ac794faeb4e6650c9faec91554fed .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/mclk.o.d" -o ${OBJECTDIR}/_ext/1360937237/mclk.o ../src/mclk.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/glck.o: ../src/glck.c  .generated_files/flags/sam_e54_cult/35b68f3f5a24e9006c31898e76dfbd4f92f84d5 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/glck.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/glck.o.d" -o ${OBJECTDIR}/_ext/1360937237/glck.o ../src/glck.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/gmac.o: ../src/gmac.c  .generated_files/flags/sam_e54_cult/75cdbb06df6441ddf05227be38f7eb208eb78260 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gmac.o.d" -o ${OBJECTDIR}/_ext/1360937237/gmac.o ../src/gmac.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp.o: ../src/ptp.c  .generated_files/flags/sam_e54_cult/aae5adc25a2028e72cfccf40caffb1bee2287423 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ptp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ptp.o.d" -o ${OBJECTDIR}/_ext/1360937237/ptp.o ../src/ptp.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ethernet.o: ../src/ethernet.c  .generated_files/flags/sam_e54_cult/11668409530e20c85c0ccc7f4b5a17bc8e7599fc .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ethernet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -I"../src" -I"../src/config/sam_e54_cult" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ethernet.o.d" -o ${OBJECTDIR}/_ext/1360937237/ethernet.o ../src/ethernet.c    -DXPRJ_sam_e54_cult=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/ptp_algo.o: ../src/ptp_algo.c  .generated_files/flags/sam_e54_cult/d3799c24c50f21dab447fc1010dd660d5f1cad46 .generated_files/flags/sam_e54_cult/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
