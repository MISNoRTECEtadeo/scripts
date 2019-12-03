#Performance Measures

library(tidyverse)
#install.packages("readxl")
library("readxl")
library('dplyr')
library(openxlsx)
library(lubridate)

########## Enrollments 
##### Does not have the special grants here, should re-write with sql or find them in Caljobs report
setwd("S:/Esteban/NoRTEC Performance/2019-2020 Q1/Enrollments")

##Credential Data 18-19
Enr_Data <- read_xlsx("Characteristics.xlsx", sheet = "Characteristics", skip = 15, col_names = TRUE, col_types = 
                        c("text","numeric","skip","numeric", "skip", "skip", "text", "skip", "text", "text", "numeric", "date", "date", 
                          "skip", "text", "skip", "skip", "text", "text", "date", "date", "date", "date", "date", "text"))

# Column types: "skip", "guess", "logical", "numeric", "date", "text" or "list"

##Column Names
Enr_Column_names <- c("LWDB/Region", "UserID", "StateID", "LastName", "FirstName", "CustomerGroup", "AppID", "AppDate", 
                      "ParticipationDate", "Office Location", "CaseManager", "Service", "ActivityProjBeginDate", "ActivityBeginDate",
                      "ActivityProjEndDate", "ActivityEndDate", "ExitDate", "ExitReason")

colnames(Enr_Data) <- Enr_Column_names

# Reduce multiple activites for one entry
Enr_Data <- Enr_Data %>%
  distinct(UserID, .keep_all = TRUE)

## Filter for Quarter
#Enr_Data <- Enr_Data %>%
#  mutate(Dates = as.Date(Enr_Data$'Exit Date', format = "%Y/%M/%D"))
Enr_Data <- Enr_Data %>%
  filter(ExitDate >= "2019/07/01" & ExitDate <= "2019/09/30" | ParticipationDate >="2019/07/01" & ParticipationDate <= "2019/09/30"| is.na(ExitDate)) %>%
  arrange(desc(`ExitDate`))

### Filter Agencies make this mutate and if else statements summarize on everything

Enr_Data <- Enr_Data %>%
  mutate('AGENCY' =  
           ifelse(`Office Location` == 'NOR JTC Tehama County', "JTC", 
                  ifelse(`Office Location` == 'NOR STEP Del Norte County' | `Office Location` == 'NOR STEP Siskiyou County', "STEP", 
                         ifelse(`Office Location` == 'NOR SMART Shasta County' | `Office Location` == 'NOR SMART Trinity County', "SMART",
                                ifelse(`Office Location` == 'NOR AFWD Butte County - Chico' | `Office Location` == 'NOR AFWD Nevada County - Truckee' |
                                         `Office Location` == 'NOR AFWD Lassen County' | `Office Location` == 'NOR AFWD Nevada County - Grass Valley' |
                                         `Office Location` == 'NOR AFWD Plumas County' | `Office Location` == 'NOR AFWD Sierra County' | 
                                         `Office Location` == 'NOR AFWD Butte County - Oroville' | `Office Location` == 'NOR AFWD Modoc County', "AFWD","Blank")))))
Enr_Agency_Count_Adult <- Enr_Data %>% 
  filter(CustomerGroup == "Adult") %>%
  group_by(AGENCY) %>%
  summarise(counts = n())

Enr_Agency_Count_DW <- Enr_Data %>% 
  filter(CustomerGroup == "Dislocated Worker") %>%
  group_by(AGENCY) %>%
  summarise(counts = n())

Enr_Agency_Count_Youth <- Enr_Data %>% 
  filter(CustomerGroup == "Youth") %>%
  group_by(AGENCY) %>%
  summarise(counts = n())

Enr_Adult_Line <- c('ADULT', "","","")
Enr_DW_Line <- c("Dislocated Worker","","","")
Enr_Youth_Line <- c("Youth","","","")

Enr_Totals <- rbind(Enr_Adult_Line, Enr_Agency_Count_Adult, Enr_DW_Line, Enr_Agency_Count_DW, Enr_Youth_Line, Enr_Agency_Count_Youth)
write.xlsx(Enr_Totals, file = "Enr_Totals.xlsx", colNames = FALSE, borders = "columns")

###########################################################################################################################
########## Emp Rate Q2

setwd("S:/Esteban/NoRTEC Performance/2019-2020 Q1/Emp Rate Q2")


##Emp Rate Second Quarter
Emp_Rate_Data <- read_xlsx("EmpRateQ2 (1).xlsx", sheet = "EmpRateQ2", skip = 4, 
                       col_types = c("text", "numeric", "numeric", "text", "numeric", "text", "text","text", "date", "text",
                                     "text", "text", "text", "text", "guess", "text", "guess", "text","text","numeric","numeric", "numeric", "numeric", "text","text",
                                     "text","text","text","text","text","text","text","text","text","text","text","text", "text"))

# Column types: "skip", "guess", "logical", "numeric", "date", "text" or "list"

##Column Names
Emp_RateQ2_Column_names <- c("LWDB", "State ID","Lead App ID", "Name", "Age", "Gender", "Responsible Office", "Assigned CM", "Exit Date",
                       "Exit Reason", "Employed at Exit", "Employed at Q2 Follow Up", "Supplemental Employed Verified", 
                       "Supplemental Earnings Q2 Follow Up", "Employed at Q2 Based on Wages", "Q2 Wages", "Youth Education or Training Q2", 
                       "Training Related Employment", "Exclude", "Numerator", "Denominator", "YouthNumerator", 
                       "YouthDenominator", "Basic Career Service", "Individual Career Service", "Training Service", "Youth Occup. Skills Training", 
                       "Other Youth Service", "Co_Enroll", "WP", "JVSG", "Adult", "Dislocated Worker", "Youth", "DWG", "TAA", "NFJP", "IWT")

colnames(Emp_Rate_Data) <- Emp_RateQ2_Column_names

## Filter for Quarter
Emp_Rate_Data <- Emp_Rate_Data %>%
  mutate(Dates = as.Date(Emp_Rate_Data$'Exit Date', format = "%Y/%M/%D"))
Emp_Rate_Data <- Emp_Rate_Data %>%
  filter(Dates >= "2018/07/01" & Dates <= "2018/09/30") # Change start and end dates

#Check Date Frames
print(min(Emp_Rate_Data$Dates)) #Beginning of dataframe
print(max(Emp_Rate_Data$Dates)) #End of dataframe

#Create Agency
Emp_Rate_Data <- Emp_Rate_Data %>%
  filter(Exclude == "N") %>% # These are the ones in global exclusion: Not Counted
  mutate(AGENCY = ifelse(`Responsible Office` == 'NOR AFWD Butte County - Chico' | `Responsible Office` == 'NOR AFWD Butte County - Oroville' | `Responsible Office` == 'NOR AFWD Lassen County'
                         | `Responsible Office` == "NOR AFWD Nevada County - Truckee" | `Responsible Office` == "NOR AFWD Nevada County - Grass Valley" | `Responsible Office` == "NOR AFWD Modoc County" | 
                           `Responsible Office` == "NOR AFWD Plumas County", "AFWD", 
                         ifelse(`Responsible Office` == "NOR JTC Tehama County", "JTC", 
                                ifelse(`Responsible Office` == "NOR SMART Shasta County" | `Responsible Office` == "NOR SMART Trinity County", "SMART", "STEP"))))


#Summary for Emp Rate Q2 ADULT
Agency_Count_Adult <- Emp_Rate_Data %>% 
  filter(Adult == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(Numerator), Denominator = sum(Denominator), Percentage = round((Numerator/Denominator)*100, digits = 2))
print(Agency_Count_Adult)

# Summary for Emp Rate Q2 Dislocated Worker
Agency_Count_DW <- Emp_Rate_Data %>% 
  filter(`Dislocated Worker` == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(Numerator), Denominator = sum(Denominator), Percentage = round((Numerator/Denominator)*100, digits = 2))
print(Agency_Count_DW)

# Summary for Emp Rate Q2 Dislocated Worker
Agency_Count_Youth <- Emp_Rate_Data %>% 
  filter(Youth == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(YouthNumerator), Denominator = sum(YouthDenominator), Percentage = round((sum(YouthNumerator)/sum(YouthDenominator))*100, digits = 2))
print(Agency_Count_Youth)

Adult_Line <- c('ADULT', "Numerator","Denominator","Percent")
DW_Line <- c("Dislocated Worker","","","")
Youth_Line <- c("Youth","","","")

Totals_EmpRateQ2 <- rbind(Adult_Line, Agency_Count_Adult, DW_Line, Agency_Count_DW, Youth_Line, Agency_Count_Youth)
write.xlsx(Totals_EmpRateQ2, file = "Totals_EmpRateQ2.xlsx", colNames = FALSE, borders = "columns")

###########################################################################################################################
######## Credential Rate Q4

#setwd("S:/Esteban/NoRTEC Performance/2019-2020 Q1/Credential Rate Q4")

##Credential Data 18-19
Cred_Data <- read_xlsx("CredentialAttainment (with new AFWD numbers).xlsx", sheet = "CredentialAttainment", skip = 4, 
                       col_types = c("text", "numeric", "numeric", "text", "numeric", "text", "text","text", "date", "text",
                                     "text", "text", "text", "date", "text", "text","text","date","text", "text", "text", "numeric","numeric",
                                     "text","text","text","text","text","text","text","text","text","text","text","text","text","text","text"))

# Column types: "skip", "guess", "logical", "numeric", "date", "text" or "list"

##Column Names
Cred_Column_names <- c("LWDB", "State ID","Lead App ID", "Name", "Age", "Gender", "Responsible Office", "Assigned CM", "Exit Date",
                       "Exit Reason", "Postsecondary Training", "Postsecondary Credential", "Postsecondary Credential Type", 
                       "Postsecondary Credential Date", "Secondary Education", "Secondary Credential", "Secondary Credential Type", 
                       "Secondary Credential Date", "Employed After Exit", "In Postsecondary after Exit", "Exclude", "Numerator", 
                       "Denominator", "Basic Career Service", "Individual Career Service", "Training Service", "Youth Occup. Skills Training", 
                       "Other Youth Service", "Co_Enroll", "WP", "JVSG", "Adult", "Dislocated Worker", "Youth", "DWG", "TAA", "NFJP", "IWT")

colnames(Cred_Data) <- Cred_Column_names

## Filter for Quarter
Cred_Data <- Cred_Data %>%
  mutate(Dates = as.Date(Cred_Data$'Exit Date', format = "%Y/%M/%D"))
Cred_Data <- Cred_Data %>%
  filter(Dates >= "2018/01/01" & Dates <= "2018/04/30") # Change start and end dates

## Write an if statement to make column of agency names in this section

Cred_Data <- Cred_Data %>%
  filter(Exclude == "N") %>% # These are the onesin global exclusion: Not Counted
  mutate(AGENCY = ifelse(`Responsible Office` == 'NOR AFWD Butte County - Chico' | `Responsible Office` == 'NOR AFWD Butte County - Oroville' | `Responsible Office` == 'NOR AFWD Lassen County'
                         | `Responsible Office` == "NOR AFWD Nevada County - Truckee" | `Responsible Office` == "NOR AFWD Nevada County - Grass Valley" | `Responsible Office` == "NOR AFWD Modoc County" | 
                           `Responsible Office` == "NOR AFWD Plumas County", "AFWD", 
                         ifelse(`Responsible Office` == "NOR JTC Tehama County", "JTC", 
                                ifelse(`Responsible Office` == "NOR SMART Shasta County" | `Responsible Office` == "NOR SMART Trinity County", "SMART", "STEP"))))

Cred_Agency_Count_Adult <- Cred_Data %>% 
  filter(Adult == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(Numerator), Denominator = sum(Denominator), Percentage = round((Numerator/Denominator)*100, digits = 2))
print(Cred_Agency_Count_Adult)

Cred_Agency_Count_DW <- Cred_Data %>% 
  filter(`Dislocated Worker` == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(Numerator), Denominator = sum(Denominator), Percentage = round((Numerator/Denominator)*100, digits = 2))
print(Cred_Agency_Count_DW)

Cred_Agency_Count_Youth <- Cred_Data %>% 
  filter(Youth == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(Numerator), Denominator = sum(Denominator), Percentage = round((Numerator/Denominator)*100, digits = 2))
print(Cred_Agency_Count_Youth)

Cred_Adult_Line <- c('ADULT', "Numerator","Denominator","Percent")
Cred_DW_Line <- c("Dislocated Worker","","","")
Cred_Youth_Line <- c("Youth","","","")

Cred_Totals <- rbind(Cred_Adult_Line, Cred_Agency_Count_Adult, Cred_DW_Line, Cred_Agency_Count_DW, Cred_Youth_Line, Cred_Agency_Count_Youth)
write.xlsx(Cred_Totals, file = "Cred_Totals.xlsx", colNames = FALSE, borders = "columns")

###########################################################################################################################
######## Median Earnings


#setwd("S:/Esteban/NoRTEC Performance/2019-2020 Q1/Median Earnings")

##Median Earning Data 
Median_Earnings_Data <- read_xlsx("MedianEarnings.xlsx", sheet = "MedianEarnings", skip = 4, 
                       col_types = c("text", "numeric", "numeric", "text", "numeric", "text", "text","text", "date", "text",
                                     "text", "text", "text", "text", "text","numeric","text", "text", "text","text","text",
                                     "text","text","text","text","text","text","text","text","text","text"))

# Column types: "skip", "guess", "logical", "numeric", "date", "text" or "list"

##Column Names
Median_Earnings_Names <- c("LWDB", "State ID","Lead App ID", "Name", "Age", "Gender", "Responsible Office", "Assigned CM", "Exit Date",
                       "Exit Reason", "Employed at Exit", "Employed at Q2 Follow Up", "Supplemental Employment Verified", "Employed at Q2 Based on Wages", 
                       "Exclude", "Earnings Q2", "Basic Career Service", "Individual Career Service", "Training Service", "Youth Occup. Skills Training", 
                       "Other Youth Service", "Co_Enroll", "WP", "JVSG", "Adult", "Dislocated Worker", "Youth", "DWG", "TAA", "NFJP", "IWT")

colnames(Median_Earnings_Data) <- Median_Earnings_Names

## Filter for Quarter
#Cred_Data <- Cred_Data %>%
#  mutate(Dates = as.Date(Cred_Data$'Exit Date', format = "%Y/%M/%D"))
Median_Earnings_Data <- Median_Earnings_Data %>%
  filter('Exit Date' >= "2018/01/01" & 'Exit Date' <= "2018/04/30") # Change start and end dates

## Write an if statement to make column of agency names in this section

Median_Earnings_Data <- Median_Earnings_Data %>%
  filter(Exclude == "N") %>% # These are the onesin global exclusion: Not Counted
  mutate(AGENCY = ifelse(`Responsible Office` == 'NOR AFWD Butte County - Chico' | `Responsible Office` == 'NOR AFWD Butte County - Oroville' | `Responsible Office` == 'NOR AFWD Lassen County'
                         | `Responsible Office` == "NOR AFWD Nevada County - Truckee" | `Responsible Office` == "NOR AFWD Nevada County - Grass Valley" | `Responsible Office` == "NOR AFWD Modoc County" | 
                           `Responsible Office` == "NOR AFWD Plumas County", "AFWD", 
                         ifelse(`Responsible Office` == "NOR JTC Tehama County", "JTC", 
                                ifelse(`Responsible Office` == "NOR SMART Shasta County" | `Responsible Office` == "NOR SMART Trinity County", "SMART", "STEP"))))

Median_Earnings_Data_Adult <- Median_Earnings_Data %>% 
  filter(Adult == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Median = median(`Earnings Q2`))
print(Median_Earnings_Data_Adult)

Median_Earnings_Data_DW <- Median_Earnings_Data %>% 
  filter(`Dislocated Worker` == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Median = median(`Earnings Q2`))
print(Median_Earnings_Data_DW)

Median_Earnings_Data_Youth <- Median_Earnings_Data %>% 
  filter(Youth == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Median = median(`Earnings Q2`))
print(Median_Earnings_Data_Youth)

Median_Earnings_Adult_Line <- c('ADULT', "Numerator","Denominator","Percent")
Median_Earnings_DW_Line <- c("Dislocated Worker","","","")
Median_Earnings_Youth_Line <- c("Youth","","","")

Median_Earnings_Totals <- rbind(Median_Earnings_Adult_Line, Median_Earnings_Data_Adult, Median_Earnings_DW_Line, Median_Earnings_Data_DW, 
                                Median_Earnings_Youth_Line, Median_Earnings_Data_Youth)
write.xlsx(Median_Earnings_Totals, file = "Median_Earnings.xlsx", colNames = FALSE, borders = "columns")


###########################################################################################################################
######## Employment or Education Rate Q4 after Exit

#setwd("S:/Esteban/NoRTEC Performance/2019-2020 Q1/Emp Rate Q4")


##Emp Rate Second Quarter
Emp_Rate_Q4_Data <- read_xlsx("EmpRateQ4.xlsx", sheet = "EmpRateQ4", skip = 5, 
                           col_types = c("text", "numeric", "numeric", "text", "numeric", "text", "text","text", "date", "text",
                                         "text", "text", "text", "numeric", "text", "numeric", "text", "text","numeric","numeric", "numeric", 
                                         "numeric", "text","text","text","text","text","text","text","text","text","text","text","text","text","text", 
                                         "text"))

# Column types: "skip", "guess", "logical", "numeric", "date", "text" or "list"

##Column Names
Emp_Rate_Q4_Column_names <- c("LWDB", "State ID","Lead App ID", "Name", "Age", "Gender", "Responsible Office", "Assigned CM", "Exit Date",
                             "Exit Reason", "Employed at Exit", "Employed at Q4 Follow Up", "Supplemental Employed Verified", 
                             "Supplemental Earnings Q4 Follow Up", "Employed at Q4 Based on Wages", "Q4 Wages", "Youth Education or Training Q4", 
                             "Exclude", "Numerator", "Denominator", "YouthNumerator", "YouthDenominator", "Basic Career Service", 
                             "Individual Career Service", "Training Service", "Youth Occup. Skills Training", "Other Youth Service", "Co_Enroll", 
                             "WP", "JVSG", "Adult", "Dislocated Worker", "Youth", "DWG", "TAA", "NFJP", "IWT")

colnames(Emp_Rate_Q4_Data) <- Emp_Rate_Q4_Column_names

## Filter for Quarter
#Emp_Rate_Q4_Data <- Emp_Rate_Q4_Data %>%
#  mutate(Dates = as.Date(Emp_Rate_Q4_Data$'Exit Date', format = "%Y/%M/%D"))
Emp_Rate_Q4_Data <- Emp_Rate_Q4_Data %>%
  filter('Exit Dates' >= "2018/07/01" & 'Exit Dates' <= "2018/09/30") # Change start and end dates

#Check Date Frames
print(min(Emp_Rate_Q4_Data$`Exit Date`)) #Beginning of dataframe
print(max(Emp_Rate_Q4_Data$`Exit Date`)) #End of dataframe

#Create Agency
Emp_Rate_Q4_Data <- Emp_Rate_Q4_Data %>%
  filter(Exclude == "N") %>% # These are the ones in global exclusion: Not Counted
  mutate(AGENCY = ifelse(`Responsible Office` == 'NOR AFWD Butte County - Chico' | `Responsible Office` == 'NOR AFWD Butte County - Oroville' | `Responsible Office` == 'NOR AFWD Lassen County'
                         | `Responsible Office` == "NOR AFWD Nevada County - Truckee" | `Responsible Office` == "NOR AFWD Nevada County - Grass Valley" | `Responsible Office` == "NOR AFWD Modoc County" | 
                           `Responsible Office` == "NOR AFWD Plumas County", "AFWD", 
                         ifelse(`Responsible Office` == "NOR JTC Tehama County", "JTC", 
                                ifelse(`Responsible Office` == "NOR SMART Shasta County" | `Responsible Office` == "NOR SMART Trinity County", "SMART", "STEP"))))


#Summary for Emp Rate Q4 ADULT
Emp_Q4_Agency_Count_Adult <- Emp_Rate_Q4_Data %>% 
  filter(Adult == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(Numerator), Denominator = sum(Denominator), Percentage = round((Numerator/Denominator)*100, digits = 2))
print(Agency_Count_Adult)

# Summary for Emp Rate Q4 Dislocated Worker
Emp_Q4_Agency_Count_DW <-Emp_Rate_Q4_Data %>% 
  filter(`Dislocated Worker` == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(Numerator), Denominator = sum(Denominator), Percentage = round((Numerator/Denominator)*100, digits = 2))
print(Agency_Count_DW)

# Summary for Emp Rate Q4 Dislocated Worker
Emp_Q4_Agency_Count_Youth <- Emp_Rate_Q4_Data %>% 
  filter(Youth == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator = sum(YouthNumerator), Denominator = sum(YouthDenominator), Percentage = round((sum(YouthNumerator)/sum(YouthDenominator))*100, digits = 2))
print(Agency_Count_Youth)

Emp_Q4_Adult_Line <- c('ADULT', "Numerator","Denominator","Percent")
Emp_Q4_DW_Line <- c("Dislocated Worker","","","")
Emp_Q4_Youth_Line <- c("Youth","","","")

Totals_Emp_Q4 <- rbind(Emp_Q4_Adult_Line, Emp_Q4_Agency_Count_Adult, Emp_Q4_DW_Line, Emp_Q4_Agency_Count_DW, 
                       Emp_Q4_Youth_Line, Emp_Q4_Agency_Count_Youth)
write.xlsx(Totals_Emp_Q4, file = "Totals_Emp_Q4.xlsx", colNames = FALSE, borders = "columns")



###########################################################################################################################
######## Measurable Skills Gain

#setwd("S:/Esteban/NoRTEC Performance/2019-2020 Q1/Measurable skills")

##Credential Data 18-19
Measurable_Skills_Data <- read_xlsx("MeasurableSkillGainsIndicators.xlsx", sheet = "MeasurableSkillGainsIndicators", skip = 4, 
                       col_types = c("text", "numeric", "numeric", "text", "numeric", "text", "text","text", "text", "date", "date", "text",
                                     "date", "date", "text", "text", "text", "text","date","text","date", "numeric", "date", "date","date",
                                     "text","text","text","text","text","text","text","text","text","text","text","text","text","text","text",
                                     "text","text","text"))

# Column types: "skip", "guess", "logical", "numeric", "date", "text" or "list"

##Column Names
Measurable_Skills_Column_names <- c("LWDB", "State ID","Lead App ID", "Name", "Age", "Gender", "Responsible Office", "Assigned CM", "blank","Entry Date",
                       "Exit Date", "Exit Reason", "Date Entered Education/Training", "Date Completed Education/Training", 
                       "Enrolled in Education/Training", "Secondary Education", "Post-Secondary Education", "OJT/RA", 
                       "EFL Gain", "Post Secondary Education after Exit", "HS Diploma or Equivalent", "Secondary Transcript/Report Card", 
                       "Post Secondary Transcript or Report Card","Training Milestone", "Skills Progression", "Exclude", "Numerator", 
                       "Denominator", "Basic Career Service", "Individual Career Service", "Training Service", "Youth Occup. Skills Training", 
                       "Other Youth Service", "Co_Enroll", "WP", "JVSG", "Adult", "Dislocated Worker", "Youth", "DWG", "TAA", "NFJP", "IWT")

colnames(Measurable_Skills_Data) <- Measurable_Skills_Column_names

## Filter for Quarter
#Measurable_Skills_Data <- Measurable_Skills_Data %>%
#  mutate(Dates = as.Date(Cred_Data$'Exit Date', format = "%Y/%M/%D"))
Measurable_Skills_Data <- Measurable_Skills_Data %>%
  filter('Exit Date' >= "2019/07/01" & 'Exit Date' <= "2019/09/30") # Change start and end dates

## Create "AGENCY"

Measurable_Skills_Data <- Measurable_Skills_Data %>%
  filter(Exclude == "N") %>% # These are the onesin global exclusion: Not Counted
  mutate(AGENCY = ifelse(`Responsible Office` == 'NOR AFWD Butte County - Chico' | `Responsible Office` == 'NOR AFWD Butte County - Oroville' | `Responsible Office` == 'NOR AFWD Lassen County'
                         | `Responsible Office` == "NOR AFWD Nevada County - Truckee" | `Responsible Office` == "NOR AFWD Nevada County - Grass Valley" | `Responsible Office` == "NOR AFWD Modoc County" | 
                           `Responsible Office` == "NOR AFWD Plumas County", "AFWD", 
                         ifelse(`Responsible Office` == "NOR JTC Tehama County", "JTC", 
                                ifelse(`Responsible Office` == "NOR SMART Shasta County" | `Responsible Office` == "NOR SMART Trinity County", "SMART", "STEP"))))

Measurable_Skills_Data_Adult <- Measurable_Skills_Data %>% 
  filter(Adult == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator_Count = sum(Numerator=="Y"), Denominator_Count = sum(Denominator =="Y"), 
            Percentage = round(sum(Numerator_Count)/sum(Denominator_Count)*100,digits = 2))
print(Measurable_Skills_Data_Adult)

Measurable_Skills_Data_DW <- Measurable_Skills_Data %>% 
  filter(`Dislocated Worker` == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator_Count = sum(Numerator=="Y"), Denominator_Count = sum(Denominator =="Y"), 
            Percentage = round(sum(Numerator_Count)/sum(Denominator_Count)*100,digits = 2))
print(Measurable_Skills_Data_DW)

Measurable_Skills_Data_Youth <- Measurable_Skills_Data %>% 
  filter(Youth == "Y") %>%
  group_by(AGENCY) %>%
  summarise(Numerator_Count = sum(Numerator=="Y"), Denominator_Count = sum(Denominator =="Y"), 
            Percentage = round(sum(Numerator_Count)/sum(Denominator_Count)*100,digits = 2))
print(Measurable_Skills_Data_Youth)

MSG_Adult_Line <- c('ADULT', "Numerator","Denominator","Percent")
MSG_DW_Line <- c("Dislocated Worker","","","")
MSG_Youth_Line <- c("Youth","","","")

MSG_Totals <- rbind(MSG_Adult_Line, Measurable_Skills_Data_Adult, MSG_DW_Line, Measurable_Skills_Data_DW, MSG_Youth_Line, Measurable_Skills_Data_Youth)
write.xlsx(MSG_Totals, file = "MSG_Totals.xlsx", colNames = FALSE, borders = "columns")
