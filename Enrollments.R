
#install.packages("tidyverse")
library(tidyverse)
#install.packages("readxl")
library("readxl")
library('dplyr')
library(openxlsx)

setwd("//NoRTEC1.NoRTEC.LOCAL/Users$/etadeo/Desktop/Enrollments")


### Filter out data and take out duplicates in Excel using userID, Last Name, StateID count row. Could do it here..

##Credential Data 18-19
Enr_Data <- read_xlsx("Characteristics (81419).xlsx", sheet = "Characteristics (2)")

### JTC Adult

JTC <- filter(Enr_Data, Enr_Data$`Office Location` == 'NOR JTC Tehama County')

ADULT_JTC <- filter(JTC, JTC$`Customer Group` == 'Adult')

JTC_Distinct_Adult <- distinct(ADULT_JTC, ADULT_JTC$`State ID`)

length(JTC_Distinct_Adult)


write.xlsx(ADULT_JTC,"ADULT_JTC.xlsx") 

Enr_Data <- read_xlsx("Enrollments080719.xlsx", sheet = "Characteristics (3)")

########## JTC Youth

JTC_Youth <- filter(JTC, JTC$`Customer Group` == 'Youth')

write.xlsx(JTC_Youth,"JTC_Youth.xlsx") 

###########

DW_JTC <- filter(JTC, JTC$`Customer Group` == 'Dislocated Worker')

Distinct_DW <- unique(DW_JTC$`State ID`)

length(Distinct_DW)

write.xlsx(DW_JTC,"DW_JTC.xlsx") 

############## STEP

STEP <- filter(Enr_Data, Enr_Data$`Office Location` == 'NOR STEP Del Norte County' | Enr_Data$`Office Location` == 'NOR STEP Siskiyou County')

ADULT_STEP <- filter(STEP, STEP$`Customer Group` == 'Adult')

STEP_Distinct_Adult <- unique(ADULT_STEP$`State ID`)

length(STEP_Distinct_Adult)

write.xlsx(ADULT_STEP,"ADULT_STEP.xlsx") 

################ STEP DW

DW_STEP <- filter(STEP, STEP$`Customer Group` == 'Dislocated Worker')

write.xlsx(DW_STEP,"DW_STEP.xlsx")   

Distinct_DW <- unique(DW_STEP$`App ID`)

length(Distinct_DW)


################# SMART 

SMART <- filter(Enr_Data, Enr_Data$`Office Location` == 'NOR SMART Shasta County' | Enr_Data$`Office Location` == 'NOR SMART Trinity County')


SMART_Adult <- filter(SMART, SMART$`Customer Group` == 'Adult')

write.xlsx(SMART_Adult,"SMART_Adult.xlsx") 


Smart_Ad <- unique(SMART_Adult$`App ID`)

length(Smart_Ad)

############# Youth SMART

SMART_Youth <- filter(SMART, SMART$`Customer Group` == 'Youth')

write.xlsx(SMART_Youth,"SMART_Youth081419.xlsx") 


################## SMART DW

SMART_DW <- filter(SMART, SMART$`Customer Group` == 'Dislocated Worker')

write.xlsx(SMART_DW,"SMART_DW.xlsx") 


Smart_DW <- unique(SMART_DW$`App ID`)

length(Smart_DW)

#########AFWD AD

AFWD <- filter(Enr_Data, Enr_Data$`Office Location` == 'NOR AFWD Butte County - Chico' | Enr_Data$`Office Location` == 'NOR AFWD Nevada County - Truckee' |
                 Enr_Data$`Office Location` == 'NOR AFWD Lassen County' | Enr_Data$`Office Location` == 'NOR AFWD Nevada County - Grass Valley' |
                 Enr_Data$`Office Location` == 'NOR AFWD Plumas County' | Enr_Data$`Office Location` == 'NOR AFWD Sierra County' | 
                 Enr_Data$`Office Location` == 'NOR AFWD Butte County - Oroville' | Enr_Data$`Office Location` == 'NOR AFWD Modoc County')


AFWD_Adult <- filter(AFWD, AFWD$`Customer Group` == 'Adult')

write.xlsx(AFWD_Adult,"AFWD_Adult.xlsx") 

######### DW

AFWD_DW <- filter(AFWD, AFWD$`Customer Group` == 'Dislocated Worker')

write.xlsx(AFWD_DW,"AFWD_DW.xlsx") 

###### Youth AFWD

AFWD_Youth <- filter(AFWD, AFWD$`Customer Group` == 'Youth')

write.xlsx(AFWD_Youth,"AFWD_Youth.xlsx")

########### STEP 

STEP <- filter(Enr_Data, Enr_Data$`Office Location` == 'NOR STEP Siskiyou County' | Enr_Data$`Office Location` == 'NOR STEP Del Norte County')

STEP_Adult <- filter(STEP, STEP$`Customer Group` == 'Adult')

write.xlsx(STEP_Adult,"STEP_Adult.xlsx")

######### STEP DW

STEP <- filter(Enr_Data, Enr_Data$`Office Location` == 'NOR STEP Siskiyou County' | Enr_Data$`Office Location` == 'NOR STEP Del Norte County')

STEP_DW <- filter(STEP, STEP$`Customer Group` == 'Dislocated Worker')

write.xlsx(STEP_DW,"STEP_DW.xlsx")

########## Youth STEP

STEP_Youth <- filter(STEP, STEP$`Customer Group` == 'Youth')

write.xlsx(STEP_Youth,"STEP_Youth.xlsx")
