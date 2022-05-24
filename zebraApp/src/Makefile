TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = zebra
DBD += zebra.dbd

zebra_DBD += base.dbd
zebra_DBD += asyn.dbd
zebra_DBD += drvAsynIPPort.dbd
zebra_DBD += ADSupport.dbd
zebra_DBD += motorSupport.dbd
zebra_DBD += devSoftMotor.dbd
zebra_DBD += zebraSupport.dbd
zebra_DBD += busySupport.dbd
zebra_DBD += devIocStats.dbd
zebra_DBD += asSupport.dbd

zebra_LIBS += asyn
zebra_LIBS += ADBase
zebra_LIBS += motor
zebra_LIBS += softMotor
zebra_LIBS += zebra
zebra_LIBS += busy
zebra_LIBS += devIocStats
zebra_LIBS += autosave

zebra_SRCS += zebra_registerRecordDeviceDriver.cpp
zebra_SRCS += zebraMain.cpp

zebra_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

