#!../../bin/linux-x86_64/zebra

< envPaths

epicsEnvSet("PORT",  "ZEBRA")
epicsEnvSet("M1",    "XF:19IDC-ES{Gon:1-Ax:O}Mtr")
epicsEnvSet("M1DIR", "-")

dbLoadDatabase("$(TOP)/dbd/zebra.dbd",0,0)
zebra_registerRecordDeviceDriver(pdbbase) 

drvAsynIPPortConfigure("ZEB", "10.19.2.53:4005")

#zebraConfig(Port, SerialPort, MaxPosCompPoints)
zebraConfig("$(PORT)", "ZEB", 100000)

dbLoadRecords("$(TOP)/db/zebra.db","PORT=$(PORT),P=XF:19IDC-ES,Q={Zeb:1},M1=$(M1),M1DIR=$(M1DIR)")
dbLoadRecords("$(IOCSTATS)/db/iocAdminSoft.db","IOC=XF:19IDC-CT{Zeb:1}")

## autosave/restore machinery
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("$(TOP)/as/save")
set_requestfile_path("$(TOP)/as/req")

set_pass0_restoreFile("info_positions.sav")
set_pass0_restoreFile("info_settings.sav")
set_pass1_restoreFile("info_settings.sav")

iocInit()

## more autosave/restore machinery
cd "$(TOP)/as/req"
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5 , "")
create_monitor_set("info_settings.req", 15 , "")

