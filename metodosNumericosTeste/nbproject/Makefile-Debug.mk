#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/correlacaoLinear.o \
	${OBJECTDIR}/fibonacci.o \
	${OBJECTDIR}/minimosQuadrados.o

# Test Directory
TESTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tests

# Test Files
TESTFILES= \
	${TESTDIR}/TestFiles/f1 \
	${TESTDIR}/TestFiles/f3 \
	${TESTDIR}/TestFiles/f2

# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-lm

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/metodosnumericosteste

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/metodosnumericosteste: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/metodosnumericosteste ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/correlacaoLinear.o: correlacaoLinear.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/correlacaoLinear.o correlacaoLinear.c

${OBJECTDIR}/fibonacci.o: fibonacci.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fibonacci.o fibonacci.c

${OBJECTDIR}/minimosQuadrados.o: minimosQuadrados.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/minimosQuadrados.o minimosQuadrados.c

# Subprojects
.build-subprojects:

# Build Test Targets
.build-tests-conf: .build-conf ${TESTFILES}
${TESTDIR}/TestFiles/f1: ${TESTDIR}/tests/correlacaoLinearTeste.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.c}   -o ${TESTDIR}/TestFiles/f1 $^ ${LDLIBSOPTIONS} -lcunit 

${TESTDIR}/TestFiles/f3: ${TESTDIR}/tests/fibonacciTeste.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.c}   -o ${TESTDIR}/TestFiles/f3 $^ ${LDLIBSOPTIONS} -lcunit 

${TESTDIR}/TestFiles/f2: ${TESTDIR}/tests/minimosQuadradosTeste.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.c}   -o ${TESTDIR}/TestFiles/f2 $^ ${LDLIBSOPTIONS} -lcunit 


${TESTDIR}/tests/correlacaoLinearTeste.o: tests/correlacaoLinearTeste.c 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/correlacaoLinearTeste.o tests/correlacaoLinearTeste.c


${TESTDIR}/tests/fibonacciTeste.o: tests/fibonacciTeste.c 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/fibonacciTeste.o tests/fibonacciTeste.c


${TESTDIR}/tests/minimosQuadradosTeste.o: tests/minimosQuadradosTeste.c 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/minimosQuadradosTeste.o tests/minimosQuadradosTeste.c


${OBJECTDIR}/correlacaoLinear_nomain.o: ${OBJECTDIR}/correlacaoLinear.o correlacaoLinear.c 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/correlacaoLinear.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.c) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/correlacaoLinear_nomain.o correlacaoLinear.c;\
	else  \
	    ${CP} ${OBJECTDIR}/correlacaoLinear.o ${OBJECTDIR}/correlacaoLinear_nomain.o;\
	fi

${OBJECTDIR}/fibonacci_nomain.o: ${OBJECTDIR}/fibonacci.o fibonacci.c 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/fibonacci.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.c) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/fibonacci_nomain.o fibonacci.c;\
	else  \
	    ${CP} ${OBJECTDIR}/fibonacci.o ${OBJECTDIR}/fibonacci_nomain.o;\
	fi

${OBJECTDIR}/minimosQuadrados_nomain.o: ${OBJECTDIR}/minimosQuadrados.o minimosQuadrados.c 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/minimosQuadrados.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.c) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/minimosQuadrados_nomain.o minimosQuadrados.c;\
	else  \
	    ${CP} ${OBJECTDIR}/minimosQuadrados.o ${OBJECTDIR}/minimosQuadrados_nomain.o;\
	fi

# Run Test Targets
.test-conf:
	@if [ "${TEST}" = "" ]; \
	then  \
	    ${TESTDIR}/TestFiles/f1 || true; \
	    ${TESTDIR}/TestFiles/f3 || true; \
	    ${TESTDIR}/TestFiles/f2 || true; \
	else  \
	    ./${TEST} || true; \
	fi

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/metodosnumericosteste

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
