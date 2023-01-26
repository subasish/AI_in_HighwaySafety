
#### code prepared by Subasish Das (s-das@tti.tamu.edu)


setwd("C:/Users/s-das/OneDrive - Texas A&M Transportation Institute/Desktop/SD_Datasets/AmazingData/CRSS")

cre16= fread("CRSS2016CSV/ACCIDENT.csv")
cre17= fread("CRSS2017CSV/ACCIDENT.csv")
cre18= fread("CRSS2018CSV/ACCIDENT.csv")
cre19= fread("CRSS2019CSV/ACCIDENT.csv")
cre20= fread("CRSS2020CSV/ACCIDENT.csv")

library(data.table)
library(dplyr)

crash= rbindlist(list(cre16, cre17, cre18, cre19, cre20), fill=TRUE)
dim(crash)

crash1= subset(crash, INT_HWY==0)
dim(crash)
dim(crash1)
names(crash1)

table(crash$YEAR)
## write.csv(crash, "CRSS_16_19_Ori.csv")

cdata <- read.csv("CodeFARSCrash.csv")

for (each_column in intersect(colnames(crash), cdata$Variable)){
  curr_dict = cdata$Variable %in% each_column
  code = cdata$Code[curr_dict]
  descr = cdata$Description[curr_dict]
  crash[[each_column]] = descr[match(crash[[each_column]], code)]
}

head(crash)
### write.csv(crash, "CRSS_16_19_Crash_Cat.csv")

setwd("J:/Amazing_Data/CRSS")

vh16= fread("CRSS2016CSV/VEHICLE.csv")
vh17= fread("CRSS2017CSV/VEHICLE.csv")
vh18= fread("CRSS2018CSV/VEHICLE.csv")
vh19= fread("CRSS2019CSV/VEHICLE.csv")
vh20= fread("CRSS2020CSV/VEHICLE.csv")
veh= rbindlist(list(vh16, vh17, vh18, vh19, vh20), fill=TRUE)
dim(veh)
head(veh)


library(data.table)
library(dplyr)
crveh= left_join(crash1, veh, by="CASENUM")
dim(crveh)

veh1= subset(crveh, VSPD_LIM < 50)
veh2= subset(veh1, BODY_TYP < 10 | BODY_TYP==49|BODY_TYP==20|
               BODY_TYP==33| BODY_TYP==48|BODY_TYP==94|BODY_TYP==97)
veh3=subset(veh2, MOD_YEAR > 2000)
dim(vehicle)
dim(veh1)
dim(veh2)
dim(veh3)
table(veh2$MAX_SEV)

veh4= subset(veh3,MAX_SEV ==1|MAX_SEV ==2|MAX_SEV ==3|MAX_SEV ==5|
               MAX_SEV ==2|MAX_SEV ==8|MAX_SEV ==9)
dim(veh4)
write.csv(veh2, "CRSS_2016_2020_Nuro1.csv")



dim(crash1)