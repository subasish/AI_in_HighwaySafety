




#### FARS
library(data.table)
setwd("C:/Users/s-das/OneDrive - Texas A&M Transportation Institute/Desktop/SD_Datasets/AmazingData/FARS/Data")
cr16 <- fread("FARS2016NationalCSV/accident.csv")
cr17 <- fread("FARS2017NationalCSV/accident.csv")
cr18 <- fread("FARS2018NationalCSV/accident.csv")
cr19 <- fread("FARS2019NationalCSV1/accident.csv")
cr20 <- fread("FARS2020NationalCSV/accident.csv")
cr16$CRASH_NUM1= paste0(cr16$YEAR,"_", cr16$ST_CASE)
cr17$CRASH_NUM1= paste0(cr17$YEAR,"_", cr17$ST_CASE)
cr18$CRASH_NUM1= paste0(cr18$YEAR,"_", cr18$ST_CASE)
cr19$CRASH_NUM1= paste0(cr19$YEAR,"_", cr19$ST_CASE)
cr20$CRASH_NUM1= paste0(cr20$YEAR,"_", cr20$ST_CASE)

crash <- rbindlist(list(cr16, cr17, cr18, cr19, cr20), fill=TRUE)
dim(crash)
table(crash$YEAR)
dim(crash)

crash1= subset(crash, FUNC_SYS!=1)
dim(crash)
dim(crash1)
table(crash1$FUNC_SYS)


crash2= crash1[, c("STATE" , "STATENAME" , "ST_CASE", "VE_TOTAL", "COUNTY", "COUNTYNAME", "CITY", "CITYNAME", "DAY", "MONTH", "MONTHNAME", 
"YEAR", "DAY_WEEKNAME", "HOUR", "HOURNAME", "NHSNAME", "ROUTENAME", "TWAY_ID", "TWAY_ID2", 
"RUR_URBNAME", "FUNC_SYSNAME", "RD_OWNERNAME", "LATITUDE", "LATITUDENAME", "LONGITUD", 
"LONGITUDNAME", "SP_JURNAME", "HARM_EVNAME", "MAN_COLLNAME", "RELJCT1NAME", "RELJCT2NAME", 
"TYP_INTNAME", "WRK_ZONENAME", "REL_ROADNAME", "LGT_CONDNAME", "WEATHER1NAME", "WEATHER2NAME", 
"WEATHERNAME", "SCH_BUSNAME", "RAILNAME", "NOT_HOURNAME", "ARR_HOUR", "ARR_HOURNAME", "ARR_MIN", 
"ARR_MINNAME", "HOSP_HR", "HOSP_HRNAME", "CF1NAME", "CF2NAME", "CF3NAME", "FATALS", 
"DRUNK_DR","CRASH_NUM1" )]




### write.csv(crash1, "2016_2019_FARS_Crash_Cat1.csv")

veh16 <- fread("FARS2016NationalCSV/Vehicle.csv")
veh17 <- fread("FARS2017NationalCSV/Vehicle.csv")
veh18 <- fread("FARS2018NationalCSV/Vehicle.csv")
veh19 <- fread("FARS2019NationalCSV1/Vehicle.csv")
veh20 <- fread("FARS2020NationalCSV/Vehicle.csv")

veh16$YEAR=rep('2016')
veh17$YEAR=rep('2017')
veh18$YEAR=rep('2018')
veh19$YEAR=rep('2019')
veh20$YEAR=rep('2020')
veh16$CRASH_NUM1= paste0(veh16$YEAR,"_", veh16$ST_CASE)
veh16$CRASH_VEH_NUM1= paste0(veh16$CRASH_NUM1, veh16$VEH_NO)
veh17$CRASH_NUM1= paste0(veh17$YEAR,"_", veh17$ST_CASE)
veh17$CRASH_VEH_NUM1= paste0(veh17$CRASH_NUM1, veh17$VEH_NO)
veh18$CRASH_NUM1= paste0(veh18$YEAR,"_", veh18$ST_CASE)
veh18$CRASH_VEH_NUM1= paste0(veh18$CRASH_NUM1, veh18$VEH_NO)
veh19$CRASH_NUM1= paste0(veh19$YEAR,"_", veh19$ST_CASE)
veh19$CRASH_VEH_NUM1= paste0(veh19$CRASH_NUM1, veh19$VEH_NO)
veh20$CRASH_NUM1= paste0(veh20$YEAR,"_", veh20$ST_CASE)
veh20$CRASH_VEH_NUM1= paste0(veh20$CRASH_NUM1, veh20$VEH_NO)

vehicle <- rbindlist(list(veh16, veh17, veh18, veh19, veh20), fill=TRUE)
dim(vehicle)
table(vehicle$YEAR)
vehicle$MOD_YEAR

veh1= vehicle[, c("YEAR", "CRASH_NUM1", "CRASH_VEH_NUM1", "ST_CASE", "VEH_NO", "NUMOCCS", "HARM_EVNAME", 
"MAN_COLLNAME", "UNITTYPENAME", "HIT_RUNNAME", "REG_STATNAME", "OWNERNAME", "MAKENAME", 
"MAK_MODNAME", "BODY_TYPNAME", "MOD_YEAR", "VINNAME", "TOW_VEHNAME", "J_KNIFENAME", 
"MCARR_I1NAME", "MCARR_I2NAME", "MCARR_IDNAME", "GVWRNAME", "V_CONFIGNAME", "CARGO_BTNAME", 
"HAZ_INVNAME", "HAZ_PLACNAME", "HAZ_IDNAME", "HAZ_CNONAME", "HAZ_RELNAME", "BUS_USENAME", 
"SPEC_USENAME", "EMER_USENAME", "TRAV_SPNAME", "UNDERIDENAME", "ROLLOVERNAME", "ROLINLOCNAME", 
"IMPACT1NAME", "DEFORMEDNAME", "TOWEDNAME", "M_HARMNAME", "VEH_SC1NAME", "VEH_SC2NAME", 
"FIRE_EXPNAME", "DR_PRESNAME", "L_STATENAME", "DR_ZIP", "DR_ZIPNAME", "L_STATUSNAME", 
"L_TYPENAME", "CDL_STATNAME", "L_ENDORSNAME", "L_COMPLNAME", "L_RESTRINAME", "DR_HGT", 
"DR_WGT", "DR_WGTNAME", "PREV_ACC", "PREV_ACCNAME", "PREV_SUS", "PREV_SUSNAME", "PREV_DWI", 
"PREV_DWINAME", "PREV_SPD", "PREV_SPDNAME", "PREV_OTH", "PREV_OTHNAME", "FIRST_MO", "FIRST_MONAME", 
"FIRST_YR", "FIRST_YRNAME", "LAST_MO", "LAST_MONAME", "LAST_YR", "LAST_YRNAME", 
"SPEEDREL", "SPEEDRELNAME", "DR_SF1NAME", "DR_SF2NAME", "DR_SF3NAME", "DR_SF4NAME", 
"VTRAFWAYNAME", "VNUM_LANNAME", "VSPD_LIMNAME", "VALIGNNAME", "VPROFILENAME", 
"VPAVETYPNAME", "VSURCONDNAME", "VTRAFCONNAME", "VTCONT_FNAME", "P_CRASH1NAME", 
"P_CRASH2NAME", "P_CRASH3NAME", "PCRASH4NAME", "PCRASH5NAME", "ACC_TYPENAME", "DEATHS", 
"DR_DRINKNAME", "TRLR1VINNAME", "TRLR2VINNAME", "TRLR3VINNAME", "PREV_SUS1", "PREV_SUS1NAME", 
"PREV_SUS2", "PREV_SUS2NAME", "PREV_SUS3", "PREV_SUS3NAME", "ADS_PRES", "ADS_PRESNAME", 
"ADS_LEV", "ADS_LEVNAME", "ADS_ENG", "ADS_ENGNAME", "MOD_YEAR")] 

library(data.table)
library(dplyr)
crveh= left_join(crash2, vehicle, by="CRASH_NUM1")
dim(crveh)

veh1= subset(crveh, VSPD_LIM < 50)
veh2= subset(veh1, BODY_TYP < 10 | BODY_TYP==49|BODY_TYP==20|
               BODY_TYP==33| BODY_TYP==48|BODY_TYP==94|BODY_TYP==97)
veh3=subset(veh2, MOD_YEAR > 2000)
dim(vehicle)
dim(veh1)
dim(veh2)
dim(veh3)
table(veh2$BODY_TYP)
names(veh3)
dat[!duplicated(dat[,1]),]
### write.csv(veh3, "FARS2016_2020_nuro1.csv")

