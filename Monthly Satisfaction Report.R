#Satisfaction survey

library(tidyverse)
#install.packages("readxl")
library("readxl")
library(dplyr)
library(openxlsx)
library(lubridate)
library(tidyr)
install.packages("pdftools")
library(pdftools)
library(gridExtra)


#Walk in Data
setwd("//NoRTEC1.NoRTEC.LOCAL/Users$/etadeo/Desktop/2018-2019 Q4/Satisfaction Surveys")


#Bring in data for responses 7/1/18-6/30/2019 ( I did this in excel to clean the data but would be better to have it here)
WalkIn_Survey_Current <- read.csv("WalkIn_responses_export (1) 080919.csv", skip = 4)

Enrolled_Survey_18_19 <- read.xlsx("responses_export_All.xlsx", sheet = "Enrolled_responses_export (7)", startRow = 4)

Employers_Survey_18_19 <- read.xlsx("responses_export_All.xlsx", sheet = "responses_export (5)")

##########Rename Variables but should be based on how it gets imported from raw file...

Column_names <- c("ID","Date","Respondent","Status","Alturas","Chico","Crescent.City","Grass.Valley","Oroville"
                  ,"Quincy","Red.Bluff","Redding","Sierraville","Susanville","Truckee"                                                                                
                  ,"Weaverville","Weed","ClientName","StaffName","Did.Not.Receive.Service.-.JobSearchAssistance"                                          
                  ,"Very.Satisfied.-.JobSearchAssistance","Satisfied.-.JobSearchAssistance","Neutral.-.JobSearchAssistance"                                                          
                  ,"Dissatisfied.-.JobSearchAssistance","Very.Dissatisfied.-.JobSearchAssistance","Did.Not.Receive.Service.-.ResumeAssistance"                                             
                  ,"Very.Satisfied.-.ResumeAssistance","Satisfied.-.ResumeAssistance","Neutral.-.ResumeAssistance","Dissatisfied.-.ResumeAssistance"                                                        
                  ,"Very.Dissatisfied.-.ResumeAssistance","Did.Not.Receive.Service.-.Typing.Test","Very.Satisfied"                                                                         
                  ,"Satisfied.-.Typing.Test","Neutral.-.Typing.Test","Dissatisfied.-.Typing.Test","Very.Dissatisfied.-.Typing.Test","Did.Not.Receive.Service.-.Computer.Use"                                                 
                  ,"Very.Satisfied.-.Computer.Use","Satisfied.-.Computer.Use","Neutral.-.Computer.Use","Dissatisfied.-.Computer.Use","Very.Dissatisfied.-.Computer.Use"                                                       
                  ,"Did.Not.Receive.Service.-.Pre-Screen","Very.Satisfied.-.Pre-Screen","Satisfied.-.Pre-Screen","Neutral.-.Pre-Screen"                                                                   
                  ,"Dissatisfied.-.Pre-Screen","Very.Dissatisfied.-.Pre-Screen","Did.Not.Receive.Service.-.Workshop","Very.Satisfied.-.Workshop"                                                              
                  ,"Satisfied.-.Workshop","Neutral.-.Workshop","Dissatisfied.-.Workshop","Very.Dissatisfied.-.Workshop","Did.Not.Receive.Service.-.Other.Testing.(Pearson.Vue,.etc.)"                            
                  ,"Very.Satisfied.-.Other.Testing.(Pearson.Vue,.etc.)","Satisfied.-.Other.Testing.(Pearson.Vue,.etc.)","Neutral.-.Other.Testing.(Pearson.Vue,.etc.)"                                            
                  ,"Dissatisfied.-.Other.Testing.(Pearson.Vue,.etc.)","Very.Dissatisfied.-.Other.Testing.(Pearson.Vue,.etc.)","Did.Not.Receive.Service.-.Other.(Please.Indicate.Service.in.Comment)"                   
                  ,"Very.Satisfied.-.Other.(Please.Indicate.Service.in.Comment)","Satisfied.-.Other.(Please.Indicate.Service.in.Comment)"                                 
                  ,"Neutral.-.Other.(Please.Indicate.Service.in.Comment)","Dissatisfied.-.Other.(Please.Indicate.Service.in.Comment)","Very.Dissatisfied.-.Other.(Please.Indicate.Service.in.Comment)"                         
                  ,"Comment.-.Other.(Please.Indicate.Service.in.Comment)","Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received."               
                  ,"Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.","Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received."   
                  ,"Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.","Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received."            
                  ,"Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.","Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner."                       
                  ,"Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.","Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner."                    
                  ,"Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.","Strongly.Agree.-.Staff.treated.me.courteously."                                         
                  ,"Somewhat.Agree.-.Staff.treated.me.courteously.","Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.","Somewhat.Disagree.-.Staff.treated.me.courteously."                                      
                  ,"Strongly.Disagree.-.Staff.treated.me.courteously.","Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available."            
                  ,"Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.","Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available."
                  ,"Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.","Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available."         
                  ,"Strongly.Agree.-.I.will.recommend.your.services.to.others.","Somewhat.Agree.-.I.will.recommend.your.services.to.others.","Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others."                 
                  ,"Somewhat.Disagree.-.I.will.recommend.your.services.to.others.","Strongly.Disagree.-.I.will.recommend.your.services.to.others."                          
                  ,"X94","Comments")

colnames(WalkIn_Survey_Current) <- Column_names

########## Separate by Last Month

#Dates <- as.POSIXct(as.numeric(WalkIn_Survey_Current$Date)*86400, origin="1899-12-30",tz="GMT")
#Smart_Dates <- WalkIn_Survey_Current %>% 
#  mutate(Dates = as.POSIXct(as.numeric(WalkIn_Survey_Current$Date)*86400, origin="1899-12-30",tz="GMT"))

WalkIn_Survey_Current <- WalkIn_Survey_Current %>%
  mutate(Dates = as.Date(WalkIn_Survey_Current$Date, format = "%m/%d/%Y"))

WalkIn_Survey_Current <- WalkIn_Survey_Current %>%
  filter(Dates >= "2019/08/01 01:00" & Dates < "2019/08/31 01:00") # Change start and end dates

############## WALK IN's #######################

#filter out Service Provider here
AFWD <- WalkIn_Survey_Current %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1)

STEP <- WalkIn_Survey_Current %>%
  filter(Crescent.City == 1 | Weed == 1)

SMART <- WalkIn_Survey_Current %>%
  filter(Redding == 1 | Weaverville == 1)

JTC <- WalkIn_Survey_Current %>%
  filter(Red.Bluff == 1)

NoRTEC <- WalkIn_Survey_Current %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1 | Crescent.City == 1 | Weed == 1 | Redding == 1 | Weaverville == 1 |
           Red.Bluff == 1)

############### Walk In
SMART_Service_Per <- paste0(round((sum(Smart_June$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(Smart_June$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                (sum(Smart_June$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_June$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                sum(Smart_June$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_June$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                sum(Smart_June$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

Service_Frac <- sprintf('%s/%s',sum(Smart_June$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(Smart_June$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                (sum(Smart_June$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_June$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                sum(Smart_June$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_June$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                 sum(Smart_June$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

#### Comments

#as.matrix(Comments_SMART)
Comments_SMART <- select(Smart_August, Date, Comments, StaffName) %>%
  filter(Comments != "")

write.xlsx(Comments_SMART, "Comments_Smart.xlsx")

#pdf("Comments Smart.pdf", height=11, width=10)
#grid.table(Comments_SMART)
#dev.off()
  
#unique(complete.cases(Comments_SMART)) Can count what types of values are in the row
#unique(is.na(Comments_SMART)) Whether NA or not

#### copy from other satisfaction code 

SMART_Service_Perc_July <- paste0(round((sum(Smart_July$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(Smart_July$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                   (sum(Smart_July$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_July$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                    sum(Smart_July$`Neither.Agree.nor.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_July$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                    sum(Smart_July$`Strongly.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_Service_Frac_July <- sprintf('%s/%s',sum(Smart_July$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(Smart_July$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                    (sum(Smart_July$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_July$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                    sum(Smart_July$`Neither.Agree.nor.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_July$`Somewhat.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                    sum(Smart_July$`Strongly.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))


SMART_Service_Perc_August <- paste0(round((sum(Smart_August$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(Smart_August$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                     (sum(Smart_August$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_August$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                     sum(Smart_August$`Neither.Agree.nor.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_August$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                     sum(Smart_August$`Strongly.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_Service_Frac_August <- sprintf('%s/%s',sum(Smart_August$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(Smart_August$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                      (sum(Smart_August$`Strongly.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_August$`Somewhat.Agree-Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                      sum(Smart_August$`Neither.Agree.nor.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(Smart_August$`Somewhat.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                      sum(Smart_August$`Strongly.Disagree-Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))


Title <- c("","Overall Satisfied Percent", "Overall Satisfied Fraction")
July <- c("July",SMART_Service_Perc_July, SMART_Service_Frac_July)
August <- c("August", SMART_Service_Perc_August, SMART_Service_Frac_August)

Smart_July_Aug_FINAL <- rbind(Title,July, August)

write.xlsx(Smart_June_July_Aug_FINAL,"Smart_June_July_Aug_FINAL.xlsx") 

