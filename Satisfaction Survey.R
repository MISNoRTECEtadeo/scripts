#Satisfaction survey

library(tidyverse)
#install.packages("readxl")
library("readxl")
library('dplyr')
library(openxlsx)
library(lubridate)


#Walk in Data
setwd("//NoRTEC1.NoRTEC.LOCAL/Users$/etadeo/Desktop/2018-2019 Q4/Satisfaction Surveys")


#Bring in data for responses 7/1/18-6/30/2019 ( I did this in excel to clean the data but would be better to have it here)
WalkIn_Survey_18_19 <- read.xlsx("responses_export_All.xlsx", sheet = "WalkIn_responses_export")

Enrolled_Survey_18_19 <- read.xlsx("responses_export_All.xlsx", sheet = "Enrolled_responses_export (7)", startRow = 4)

Employers_Survey_18_19 <- read.xlsx("responses_export_All.xlsx", sheet = "responses_export (5)")

############## WALK IN's #######################

#filter out Service Provider here
AFWD <- WalkIn_Survey_18_19 %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1)

STEP <- WalkIn_Survey_18_19 %>%
  filter(Crescent.City == 1 | Weed == 1)

SMART <- WalkIn_Survey_18_19 %>%
  filter(Redding == 1 | Weaverville == 1)

JTC <- WalkIn_Survey_18_19 %>%
  filter(Red.Bluff == 1)

NoRTEC <- WalkIn_Survey_18_19 %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1 | Crescent.City == 1 | Weed == 1 | Redding == 1 | Weaverville == 1 |
           Red.Bluff == 1)

#########Overall, I am Satisfied with the service(s) I received

NoRTEC_Service_Perc <- paste0(round((sum(NoRTEC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
   (sum(NoRTEC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
    sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
    sum(NoRTEC$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_Service_Frac <- sprintf('%s/%s',sum(NoRTEC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
    (sum(NoRTEC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
     sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
     sum(NoRTEC$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

AFWD_Service_Perc <- paste0(round((sum(AFWD$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
    (sum(AFWD$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
    sum(AFWD$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
    sum(AFWD$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_Service_Frac <- sprintf('%s/%s',sum(AFWD$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
    (sum(AFWD$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
    sum(AFWD$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
    sum(AFWD$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

JTC_Service_Perc <- paste0(round((sum(JTC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
   (sum(JTC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
    sum(JTC$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
    sum(JTC$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_Service_Frac <- sprintf('%s/%s',sum(JTC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
    (sum(JTC$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
     sum(JTC$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
     sum(JTC$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

SMART_Service_Perc <- paste0(round((sum(SMART$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
     (sum(SMART$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
      sum(SMART$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
      sum(SMART$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_Service_Frac <- sprintf('%s/%s',sum(SMART$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
      (sum(SMART$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
       sum(SMART$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
       sum(SMART$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

STEP_Service_Perc <- paste0(round((sum(STEP$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
       (sum(STEP$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
        sum(STEP$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
        sum(STEP$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_Service_Frac <- sprintf('%s/%s',sum(STEP$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
       (sum(STEP$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
        sum(STEP$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
        sum(STEP$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))


#########Staff responded to my needs in a timely manner

NoRTEC_St_Resp_Perc <- paste0(round((sum(NoRTEC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) /
         (sum(NoRTEC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
          sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
          sum(NoRTEC$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_St_Resp_Frac <- sprintf('%s/%s',sum(NoRTEC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE),
          (sum(NoRTEC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
           sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
           sum(NoRTEC$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)))

AFWD_St_Resp_Perc <- paste0(round((sum(AFWD$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) /
           (sum(AFWD$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
            sum(AFWD$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
            sum(AFWD$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_St_Resp_Frac <- sprintf('%s/%s',sum(AFWD$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE),
           (sum(AFWD$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
           sum(AFWD$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
           sum(AFWD$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)))

JTC_St_Resp_Perc <- paste0(round((sum(JTC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) /
            (sum(JTC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
            sum(JTC$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
            sum(JTC$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_St_Resp_Frac <- sprintf('%s/%s',sum(JTC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE),
            (sum(JTC$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
             sum(JTC$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
             sum(JTC$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)))

SMART_St_Resp_Perc <- paste0(round((sum(SMART$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) /
             (sum(SMART$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
              sum(SMART$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
              sum(SMART$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_St_Resp_Frac <- sprintf('%s/%s',sum(SMART$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE),
             (sum(SMART$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
             sum(SMART$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
             sum(SMART$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)))

STEP_St_Resp_Perc <- paste0(round((sum(STEP$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) /
              (sum(STEP$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
              sum(STEP$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
              sum(STEP$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_St_Resp_Frac <- sprintf('%s/%s',sum(STEP$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE),
              (sum(STEP$`Strongly.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.responded.to.my.needs.in.a.timely.manner.`,na.rm = TRUE) +
               sum(STEP$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE) +
               sum(STEP$`Strongly.Disagree.-.Staff.responded.to.my.needs.in.a.timely.manner.`, na.rm = TRUE)))

#########Staff treated me Curteously

NoRTEC_St_Curt_Perc <- paste0(round((sum(NoRTEC$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) /
           (sum(NoRTEC$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
           sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
           sum(NoRTEC$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_St_Curt_Frac <- sprintf('%s/%s',sum(NoRTEC$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE),
           (sum(NoRTEC$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
           sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
           sum(NoRTEC$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)))

AFWD_St_Curt_Perc <- paste0(round((sum(AFWD$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) /
           (sum(AFWD$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
            sum(AFWD$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
            sum(AFWD$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_St_Curt_Frac <- sprintf('%s/%s',sum(AFWD$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE),
            (sum(AFWD$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
             sum(AFWD$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
             sum(AFWD$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)))

JTC_St_Curt_Perc <- paste0(round((sum(JTC$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) /
            (sum(JTC$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
            sum(JTC$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
            sum(JTC$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_St_Curt_Frac <- sprintf('%s/%s',sum(JTC$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE),
             (sum(JTC$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
              sum(JTC$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
              sum(JTC$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)))

SMART_St_Curt_Perc <- paste0(round((sum(SMART$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) /
              (sum(SMART$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
               sum(SMART$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
               sum(SMART$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_St_Curt_Frac <- sprintf('%s/%s',sum(SMART$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE),
               (sum(SMART$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
                sum(SMART$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
                sum(SMART$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)))

STEP_St_Curt_Perc <- paste0(round((sum(STEP$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) /
                (sum(STEP$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
                sum(STEP$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
                sum(STEP$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_St_Curt_Frac <- sprintf('%s/%s',sum(STEP$`Strongly.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE),
                (sum(STEP$`Strongly.Agree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.treated.me.courteously.`,na.rm = TRUE) +
                 sum(STEP$`Neither.Agree.nor.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE) +
                 sum(STEP$`Strongly.Disagree.-.Staff.treated.me.courteously.`, na.rm = TRUE)))

############# Staff Helped my clearly understand the services available

NoRTEC_St_Help_Perc <- paste0(round((sum(NoRTEC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) /
                 (sum(NoRTEC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                 sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                 sum(NoRTEC$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_St_Help_Frac <- sprintf('%s/%s',sum(NoRTEC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE),
                 (sum(NoRTEC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                  sum(NoRTEC$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                  sum(NoRTEC$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)))

AFWD_St_Help_Perc <- paste0(round((sum(AFWD$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) /
                  (sum(AFWD$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                   sum(AFWD$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                   sum(AFWD$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_St_Help_Frac <- sprintf('%s/%s',sum(AFWD$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE),
                   (sum(AFWD$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                   sum(AFWD$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                   sum(AFWD$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)))

JTC_St_Help_Perc <- paste0(round((sum(JTC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) /
                   (sum(JTC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                    sum(JTC$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                    sum(JTC$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_St_Help_Frac <- sprintf('%s/%s',sum(JTC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE),
                   (sum(JTC$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                    sum(JTC$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                    sum(JTC$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)))

SMART_St_Help_Perc <- paste0(round((sum(SMART$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) /
                    (sum(SMART$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                     sum(SMART$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                     sum(SMART$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_St_Help_Frac <- sprintf('%s/%s',sum(SMART$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE),
                     (sum(SMART$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                      sum(SMART$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                      sum(SMART$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)))

STEP_St_Help_Perc <- paste0(round((sum(STEP$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) /
                     (sum(STEP$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                      sum(STEP$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                      sum(STEP$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_St_Help_Frac <- sprintf('%s/%s',sum(STEP$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE),
                    (sum(STEP$`Strongly.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.Staff.helped.me.clearly.understand.the.services.available.`,na.rm = TRUE) +
                      sum(STEP$`Neither.Agree.nor.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE) +
                      sum(STEP$`Strongly.Disagree.-.Staff.helped.me.clearly.understand.the.services.available.`, na.rm = TRUE)))

########### I will recommend your services to others

NoRTEC_Rec_Others_Perc <- paste0(round((sum(NoRTEC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                      (sum(NoRTEC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                      sum(NoRTEC$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                      sum(NoRTEC$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_Rec_Others_Frac <- sprintf('%s/%s',sum(NoRTEC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                      (sum(NoRTEC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                      sum(NoRTEC$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                      sum(NoRTEC$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

AFWD_Rec_Others_Perc <- paste0(round((sum(AFWD$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                       (sum(AFWD$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                        sum(AFWD$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                        sum(AFWD$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_Rec_Others_Frac <- sprintf('%s/%s',sum(AFWD$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                        (sum(AFWD$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                         sum(AFWD$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                         sum(AFWD$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

JTC_Rec_Others_Perc <- paste0(round((sum(JTC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                         (sum(JTC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                          sum(JTC$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                          sum(JTC$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_Rec_Others_Frac <- sprintf('%s/%s',sum(JTC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                          (sum(JTC$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                          sum(JTC$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                          sum(JTC$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

SMART_Rec_Others_Perc <- paste0(round((sum(SMART$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                         (sum(SMART$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                          sum(SMART$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                          sum(SMART$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_Rec_Others_Frac <- sprintf('%s/%s',sum(SMART$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                         (sum(SMART$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                          sum(SMART$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                          sum(SMART$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

STEP_Rec_Others_Perc <- paste0(round((sum(STEP$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                         (sum(STEP$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                          sum(STEP$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                          sum(STEP$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_Rec_Others_Frac <- sprintf('%s/%s',sum(STEP$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                         (sum(STEP$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                          sum(STEP$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                          sum(STEP$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

####### ENROLLED CLIENTS ################

#Reshape_Data <- tail(Enrolled_Survey_18_19,-3)
# <- substr(Reshape_Data$X2, start = 0, stop = 5) Takes only 5 characters starting from left

AFWD_Enr <- Enrolled_Survey_18_19 %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1)

STEP_Enr <- Enrolled_Survey_18_19 %>%
  filter(Crescent.City == 1 | Weed == 1)

SMART_Enr <- Enrolled_Survey_18_19 %>%
  filter(Redding == 1 | Weaverville == 1)

JTC_Enr <- Enrolled_Survey_18_19 %>%
  filter(Red.Bluff == 1)

NoRTEC_Enr <- Enrolled_Survey_18_19 %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1 | Crescent.City == 1 | Weed == 1 | Redding == 1 | Weaverville == 1 |
           Red.Bluff == 1)

#I am satisfied with the services I recieved

NoRTEC_sat_serv_Perc <- paste0(round((sum(NoRTEC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
         (sum(NoRTEC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
          sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
          sum(NoRTEC_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_sat_serv_Frac <- sprintf('%s/%s',sum(NoRTEC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
          (sum(NoRTEC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
           sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
           sum(NoRTEC_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

AFWD_sat_serv_Perc <- paste0(round((sum(AFWD_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
           (sum(AFWD_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
            sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
            sum(AFWD_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_sat_serv_Frac <- sprintf('%s/%s',sum(AFWD_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
            (sum(AFWD_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
             sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
             sum(AFWD_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

JTC_sat_serv_Perc <- paste0(round((sum(JTC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
            (sum(JTC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
             sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
             sum(JTC_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_sat_serv_Frac <- sprintf('%s/%s',sum(JTC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
            (sum(JTC_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
             sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
             sum(JTC_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

SMART_sat_serv_Perc <- paste0(round((sum(SMART_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
             (sum(SMART_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
              sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
              sum(SMART_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_sat_serv_Frac <- sprintf('%s/%s',sum(SMART_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
             (sum(SMART_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
              sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
              sum(SMART_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

STEP_sat_serv_Perc <- paste0(round((sum(STEP_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
             (sum(STEP_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
              sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
              sum(STEP_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_sat_serv_Frac <- sprintf('%s/%s',sum(STEP_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
               (sum(STEP_Enr$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                sum(STEP_Enr$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

#########Services were convenient to use

NoRTEC_conv_use_Perc <- paste0(round((sum(NoRTEC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                (sum(NoRTEC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                 sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                 sum(NoRTEC_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_conv_use_serv_Frac <- sprintf('%s/%s',sum(NoRTEC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                 (sum(NoRTEC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                  sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                  sum(NoRTEC_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

AFWD_conv_use_Perc <- paste0(round((sum(AFWD_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                   (sum(AFWD_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                   sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                   sum(AFWD_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_conv_use_serv_Frac <- sprintf('%s/%s',sum(AFWD_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                  (sum(AFWD_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                   sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                   sum(AFWD_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

JTC_conv_use_Perc <- paste0(round((sum(JTC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                   (sum(JTC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                   sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                   sum(JTC_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_conv_use_serv_Frac <- sprintf('%s/%s',sum(JTC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                  (sum(JTC_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                   sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                   sum(JTC_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

SMART_conv_use_Perc <- paste0(round((sum(SMART_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                   (sum(SMART_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                    sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                    sum(SMART_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_conv_use_serv_Frac <- sprintf('%s/%s',sum(SMART_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                   (sum(SMART_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                    sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                    sum(SMART_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

STEP_conv_use_Perc <- paste0(round((sum(STEP_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                   (sum(STEP_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                    sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                    sum(STEP_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_conv_use_serv_Frac <- sprintf('%s/%s',sum(STEP_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                   (sum(STEP_Enr$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                    sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                    sum(STEP_Enr$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

################ Staff was knowledgeable and professional

NoRTEC_Know_Perc <- paste0(round((sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) /
                    (sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                     sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                     sum(NoRTEC_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_Know_serv_Frac <- sprintf('%s/%s',sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE),
                    (sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                     sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                     sum(NoRTEC_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)))

AFWD_Know_serve_Perc <- paste0(round((sum(AFWD_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) /
                    (sum(AFWD_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                     sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                     sum(AFWD_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_Know_serv_Frac <- sprintf('%s/%s',sum(AFWD_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE),
                     (sum(AFWD_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                      sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                      sum(AFWD_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)))

JTC_Know_serv_Perc <- paste0(round((sum(JTC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) /
                      (sum(JTC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                       sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                       sum(JTC_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_Know_serv_Frac <- sprintf('%s/%s',sum(JTC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE),
                       (sum(JTC_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                        sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                        sum(JTC_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)))

SMART_Know_Perc <- paste0(round((sum(SMART_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) /
                       (sum(SMART_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                        sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                        sum(SMART_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_Know_serv_Frac <- sprintf('%s/%s',sum(SMART_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE),
                        (sum(SMART_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                        sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                        sum(SMART_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)))

STEP_Know_Perc <- paste0(round((sum(STEP_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) /
                        (sum(STEP_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                         sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                         sum(STEP_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_Know_serv_Frac <- sprintf('%s/%s',sum(STEP_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE),
                         (sum(STEP_Enr$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional.`,na.rm = TRUE) +
                          sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE) +
                          sum(STEP_Enr$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional.`, na.rm = TRUE)))

##################### Staff listened to my needs

NoRTEC_Staff_List_Perc <- paste0(round((sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                          (sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                           sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                           sum(NoRTEC_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_Staff_List_Frac <- sprintf('%s/%s',sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                          (sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                           sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                           sum(NoRTEC_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

AFWD_Staff_List_Perc <- paste0(round((sum(AFWD_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                           (sum(AFWD_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                            sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                            sum(AFWD_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_Staff_List_Frac <- sprintf('%s/%s',sum(AFWD_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                           (sum(AFWD_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                            sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                            sum(AFWD_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

JTC_Staff_List_Perc <- paste0(round((sum(JTC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                            (sum(JTC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                            sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                            sum(JTC_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_Staff_List_Frac <- sprintf('%s/%s',sum(JTC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                            (sum(JTC_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                            sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                            sum(JTC_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

SMART_Staff_List_Perc <- paste0(round((sum(SMART_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                             (sum(SMART_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                              sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                              sum(SMART_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_Staff_List_Frac <- sprintf('%s/%s',sum(SMART_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                             (sum(SMART_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                              sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                              sum(SMART_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

STEP_Staff_List_Perc <- paste0(round((sum(STEP_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                              (sum(STEP_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                              sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                              sum(STEP_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_Staff_List_Frac <- sprintf('%s/%s',sum(STEP_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                              (sum(STEP_Enr$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                               sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                               sum(STEP_Enr$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

################ Staff responded to my questions in a timely manner

NoRTEC_Staff_Resp_Perc <- paste0(round((sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                               (sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_Staff_Resp_Frac <- sprintf('%s/%s',sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                               (sum(NoRTEC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

AFWD_Staff_Resp_Perc <- paste0(round((sum(AFWD_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                                (sum(AFWD_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                 sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                 sum(AFWD_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_Staff_Resp_Frac <- sprintf('%s/%s',sum(AFWD_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                               (sum(AFWD_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                sum(AFWD_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

JTC_Staff_Resp_Perc <- paste0(round((sum(JTC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                              (sum(JTC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                               sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                               sum(JTC_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_Staff_Resp_Frac <- sprintf('%s/%s',sum(JTC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                               (sum(JTC_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                sum(JTC_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

SMART_Staff_Resp_Perc <- paste0(round((sum(SMART_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                                (sum(SMART_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                 sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                 sum(SMART_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_Staff_Resp_Frac <- sprintf('%s/%s',sum(SMART_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                              (sum(SMART_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                 sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                 sum(SMART_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

STEP_Staff_Resp_Perc <- paste0(round((sum(STEP_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                               (sum(STEP_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                sum(STEP_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_Staff_Resp_Frac <- sprintf('%s/%s',sum(STEP_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                                (sum(STEP_Enr$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                                sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                                sum(STEP_Enr$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

################ The information I received was clear

NoRTEC_info_clear_Perc <- paste0(round((sum(NoRTEC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                               (sum(NoRTEC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_info_clear_Frac <- sprintf('%s/%s',sum(NoRTEC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                               (sum(NoRTEC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

AFWD_info_clear_Perc <- paste0(round((sum(AFWD_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                                (sum(AFWD_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                 sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                 sum(AFWD_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_info_clear_Frac <- sprintf('%s/%s',sum(AFWD_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                                (sum(AFWD_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                sum(AFWD_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

JTC_info_clear_Perc <- paste0(round((sum(JTC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                                (sum(JTC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                 sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                 sum(JTC_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_info_clear_Frac <- sprintf('%s/%s',sum(JTC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                                (sum(JTC_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                sum(JTC_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

SMART_info_clear_Perc <- paste0(round((sum(SMART_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                                 (sum(SMART_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                  sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                  sum(SMART_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_info_clear_Frac <- sprintf('%s/%s',sum(SMART_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                               (sum(SMART_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                sum(SMART_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

STEP_info_clear_Perc <- paste0(round((sum(STEP_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                                (sum(STEP_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                 sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                 sum(STEP_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_info_clear_Frac <- sprintf('%s/%s',sum(STEP_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                                 (sum(STEP_Enr$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                                  sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                                  sum(STEP_Enr$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

########### I will recommend your services to others

NoRTEC_rec_serv_Perc <- paste0(round((sum(NoRTEC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                               (sum(NoRTEC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_rec_serv_Frac <- sprintf('%s/%s',sum(NoRTEC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                               (sum(NoRTEC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                                sum(NoRTEC_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

AFWD_rec_serv_Perc <- paste0(round((sum(AFWD_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                               (sum(AFWD_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                                sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                                sum(AFWD_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_rec_serv_Frac <- sprintf('%s/%s',sum(AFWD_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                               (sum(AFWD_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                                sum(AFWD_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                                sum(AFWD_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

JTC_rec_serv_Perc <- paste0(round((sum(JTC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                               (sum(JTC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                                sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                                sum(JTC_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_rec_serv_Frac <- sprintf('%s/%s',sum(JTC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                              (sum(JTC_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                                sum(JTC_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                                sum(JTC_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

SMART_rec_serv_Perc <- paste0(round((sum(SMART_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                              (sum(SMART_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(SMART_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_rec_serv_Frac <- sprintf('%s/%s',sum(SMART_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                             (sum(SMART_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(SMART_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(SMART_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

STEP_rec_serv_Perc <- paste0(round((sum(STEP_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                              (sum(STEP_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(STEP_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_rec_serv_Frac <- sprintf('%s/%s',sum(STEP_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                               (sum(STEP_Enr$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                               sum(STEP_Enr$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Enr$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                               sum(STEP_Enr$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

########### Business Data
#filter out Service Provider here

AFWD_Emp <- Employers_Survey_18_19 %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1)

STEP_Emp <- Employers_Survey_18_19 %>%
  filter(Crescent.City == 1 | Weed == 1)

SMART_Emp <- Employers_Survey_18_19 %>%
  filter(Redding == 1 | Weaverville == 1)

JTC_Emp <- Employers_Survey_18_19 %>%
  filter(Red.Bluff == 1)

NoRTEC_Emp <- Employers_Survey_18_19 %>%
  filter(Chico == 1 | Oroville == 1 | Alturas == 1 | Quincy == 1 | Sierraville == 1 | Susanville == 1
         | Truckee == 1 | Grass.Valley == 1 | Crescent.City == 1 | Weed == 1 | Redding == 1 | Weaverville == 1 |
           Red.Bluff == 1)

############## I am satisfied with the services I recieved

NoRTEC_emp_sat_serv_Perc <- paste0(round((sum(NoRTEC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                 (sum(NoRTEC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                  sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                  sum(NoRTEC_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_emp_sat_serv_Frac <- sprintf('%s/%s',sum(NoRTEC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                 (sum(NoRTEC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                  sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                  sum(NoRTEC_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

AFWD_emp_sat_serv_Perc <- paste0(round((sum(AFWD_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                 (sum(AFWD_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                  sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                  sum(AFWD_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_emp_sat_serv_Frac <- sprintf('%s/%s',sum(AFWD_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                 (sum(AFWD_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                  sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                  sum(AFWD_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

JTC_emp_sat_serv_Perc <- paste0(round((sum(JTC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                (sum(JTC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                 sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                 sum(JTC_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_emp_sat_serv_Frac <- sprintf('%s/%s',sum(JTC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                (sum(JTC_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                 sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                 sum(JTC_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

SMART_emp_sat_serv_Perc <- paste0(round((sum(SMART_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                 (sum(SMART_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                  sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                  sum(SMART_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_emp_sat_serv_Frac <- sprintf('%s/%s',sum(SMART_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                  (sum(SMART_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                  sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                  sum(SMART_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

STEP_emp_sat_serv_Perc <- paste0(round((sum(STEP_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) /
                  (sum(STEP_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                   sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                   sum(STEP_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_emp_sat_serv_Frac <- sprintf('%s/%s',sum(STEP_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE),
                  (sum(STEP_Emp$`Strongly.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`,na.rm = TRUE) +
                   sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE) +
                   sum(STEP_Emp$`Strongly.Disagree.-.Overall,.I.am.satisfied.with.the.service(s).I.received.`, na.rm = TRUE)))

################ Services were convenient to use

NoRTEC_serv_conv_Perc <- paste0(round((sum(NoRTEC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                   (sum(NoRTEC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                    sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                    sum(NoRTEC_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_serv_conv_Frac <- sprintf('%s/%s',sum(NoRTEC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                    (sum(NoRTEC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                     sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                     sum(NoRTEC_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

AFWD_serv_conv_Perc <- paste0(round((sum(AFWD_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                    (sum(AFWD_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                     sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                     sum(AFWD_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_serv_conv_Frac <- sprintf('%s/%s',sum(AFWD_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                    (sum(AFWD_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                     sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                     sum(AFWD_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

JTC_serv_conv_Perc <- paste0(round((sum(JTC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                    (sum(JTC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                     sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                     sum(JTC_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_serv_conv_Frac <- sprintf('%s/%s',sum(JTC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                    (sum(JTC_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                     sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                     sum(JTC_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

SMART_serv_conv_Perc <- paste0(round((sum(SMART_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                    (sum(SMART_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                     sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                     sum(SMART_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_serv_conv_Frac <- sprintf('%s/%s',sum(SMART_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                     (sum(SMART_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                      sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                      sum(SMART_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

STEP_serv_conv_Perc <- paste0(round((sum(STEP_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) /
                      (sum(STEP_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                       sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                       sum(STEP_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_serv_conv_Frac <- sprintf('%s/%s',sum(STEP_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE),
                       (sum(STEP_Emp$`Strongly.Agree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Services.were.convenient.to.use.`,na.rm = TRUE) +
                        sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE) +
                        sum(STEP_Emp$`Strongly.Disagree.-.Services.were.convenient.to.use.`, na.rm = TRUE)))

############# Staff was knowledgeable and professional

NoRTEC_staff_know_Perc <- paste0(round((sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) /
                         (sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                         sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                         sum(NoRTEC_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_staff_know_Frac <- sprintf('%s/%s',sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE),
                         (sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                          sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                          sum(NoRTEC_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)))

AFWD_staff_know_Perc <- paste0(round((sum(AFWD_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) /
                          (sum(AFWD_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                           sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                           sum(AFWD_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_staff_know_Frac <- sprintf('%s/%s',sum(AFWD_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE),
                          (sum(AFWD_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                           sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                           sum(AFWD_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)))

JTC_staff_know_Perc <- paste0(round((sum(JTC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) /
                          (sum(JTC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                           sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                           sum(JTC_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_staff_know_Frac <- sprintf('%s/%s',sum(JTC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE),
                          (sum(JTC_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                           sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                           sum(JTC_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)))

SMART_staff_know_Perc <- paste0(round((sum(SMART_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) /
                           (sum(SMART_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                            sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                            sum(SMART_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_staff_know_Frac <- sprintf('%s/%s',sum(SMART_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE),
                           (sum(SMART_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                            sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                            sum(SMART_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)))

STEP_staff_know_Perc <- paste0(round((sum(STEP_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) /
                           (sum(STEP_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                            sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                            sum(STEP_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_staff_know_Frac <- sprintf('%s/%s',sum(STEP_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE),
                          (sum(STEP_Emp$`Strongly.Agree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.was.knowledgeable.and.professional`,na.rm = TRUE) +
                           sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE) +
                           sum(STEP_Emp$`Strongly.Disagree.-.Staff.was.knowledgeable.and.professional`, na.rm = TRUE)))

############# Staff listened to my needs

NoRTEC_emp_staff_list_Perc <- paste0(round((sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                          (sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                           sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                           sum(NoRTEC_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_emp_staff_list_Frac <- sprintf('%s/%s',sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                          (sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                           sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                           sum(NoRTEC_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

AFWD_emp_staff_list_Perc <- paste0(round((sum(AFWD_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                           (sum(AFWD_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                            sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                            sum(AFWD_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_emp_staff_list_Frac <- sprintf('%s/%s',sum(AFWD_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                            (sum(AFWD_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                             sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                             sum(AFWD_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

JTC_emp_staff_list_Perc <- paste0(round((sum(JTC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                           (sum(JTC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                            sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                            sum(JTC_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_emp_staff_list_Frac <- sprintf('%s/%s',sum(JTC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                           (sum(JTC_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                            sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                            sum(JTC_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

SMART_emp_staff_list_Perc <- paste0(round((sum(SMART_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                            (sum(SMART_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                             sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                             sum(SMART_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_emp_staff_list_Frac <- sprintf('%s/%s',sum(SMART_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                            (sum(SMART_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                             sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                             sum(SMART_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

STEP_emp_staff_list_Perc <- paste0(round((sum(STEP_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) /
                            (sum(STEP_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                             sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                             sum(STEP_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_emp_staff_list_Frac <- sprintf('%s/%s',sum(STEP_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE),
                            (sum(STEP_Emp$`Strongly.Agree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.listened.to.my.needs.`,na.rm = TRUE) +
                             sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE) +
                             sum(STEP_Emp$`Strongly.Disagree.-.Staff.listened.to.my.needs.`, na.rm = TRUE)))

################# Staff responded to my questions in a timely manner

NoRTEC_emp_staff_resp_Perc <- paste0(round((sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                           (sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                            sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                            sum(NoRTEC_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_emp_staff_resp_Frac <- sprintf('%s/%s',sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                           (sum(NoRTEC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                            sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                            sum(NoRTEC_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

AFWD_emp_staff_resp_Perc <- paste0(round((sum(AFWD_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                            (sum(AFWD_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                            sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                            sum(AFWD_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_emp_staff_resp_Frac <- sprintf('%s/%s',sum(AFWD_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                            (sum(AFWD_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                             sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                             sum(AFWD_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

JTC_emp_staff_resp_Perc <- paste0(round((sum(JTC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                            (sum(JTC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                             sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                             sum(JTC_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_emp_staff_resp_Frac <- sprintf('%s/%s',sum(JTC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                            (sum(JTC_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                             sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                             sum(JTC_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

SMART_emp_staff_resp_Perc <- paste0(round((sum(SMART_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                             (sum(SMART_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                              sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                              sum(SMART_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_emp_staff_resp_Frac <- sprintf('%s/%s',sum(SMART_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                              (sum(SMART_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                               sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                               sum(SMART_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

STEP_emp_staff_resp_Perc <- paste0(round((sum(STEP_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) /
                            (sum(STEP_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                              sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                              sum(STEP_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_emp_staff_resp_Frac <- sprintf('%s/%s',sum(STEP_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE),
                              (sum(STEP_Emp$`Strongly.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.Staff.responded.to.my.questions.in.a.timely.manner.`,na.rm = TRUE) +
                              sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE) +
                              sum(STEP_Emp$`Strongly.Disagree.-.Staff.responded.to.my.questions.in.a.timely.manner.`, na.rm = TRUE)))

################## The information I recieved was clear

NoRTEC_emp_info_clear_Perc <- paste0(round((sum(NoRTEC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                             (sum(NoRTEC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                              sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                              sum(NoRTEC_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_emp_info_clear_Frac <- sprintf('%s/%s',sum(NoRTEC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                            (sum(NoRTEC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                             sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                             sum(NoRTEC_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

AFWD_emp_info_clear_Perc <- paste0(round((sum(AFWD_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                            (sum(AFWD_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                             sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                             sum(AFWD_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_emp_info_clear_Frac <- sprintf('%s/%s',sum(AFWD_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                            (sum(AFWD_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                            sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                            sum(AFWD_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

JTC_emp_info_clear_Perc <- paste0(round((sum(JTC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                            (sum(JTC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                             sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                             sum(JTC_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_emp_info_clear_Frac <- sprintf('%s/%s',sum(JTC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                           (sum(JTC_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                            sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                            sum(JTC_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

SMART_emp_info_clear_Perc <- paste0(round((sum(SMART_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                            (sum(SMART_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                             sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                             sum(SMART_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_emp_info_clear_Frac <- sprintf('%s/%s',sum(SMART_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                             (sum(SMART_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                              sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                              sum(SMART_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

STEP_emp_info_clear_Perc <- paste0(round((sum(STEP_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) /
                           (sum(STEP_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                            sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                            sum(STEP_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_emp_info_clear_Frac <- sprintf('%s/%s',sum(STEP_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE),
                           (sum(STEP_Emp$`Strongly.Agree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.The.information.I.received.was.clear.`,na.rm = TRUE) +
                            sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE) +
                            sum(STEP_Emp$`Strongly.Disagree.-.The.information.I.received.was.clear.`, na.rm = TRUE)))

################# I will recommend your services to others

NoRTEC_emp_rec_serv_Perc <- paste0(round((sum(NoRTEC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                             (sum(NoRTEC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(NoRTEC_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

NoRTEC_emp_rec_serv_Frac <- sprintf('%s/%s',sum(NoRTEC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                             (sum(NoRTEC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(NoRTEC_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(NoRTEC_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(NoRTEC_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

AFWD_emp_rec_serv_Perc <- paste0(round((sum(AFWD_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                              (sum(AFWD_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(AFWD_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

AFWD_emp_rec_serv_Frac <- sprintf('%s/%s',sum(AFWD_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                             (sum(AFWD_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(AFWD_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(AFWD_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(AFWD_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

JTC_emp_rec_serv_Perc <- paste0(round((sum(JTC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                             (sum(JTC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                             sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                             sum(JTC_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

JTC_emp_rec_serv_Frac <- sprintf('%s/%s',sum(JTC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                            (sum(JTC_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                             sum(JTC_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(JTC_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                             sum(JTC_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

SMART_emp_rec_serv_Perc <- paste0(round((sum(SMART_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                              (sum(SMART_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(SMART_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

SMART_emp_rec_serv_Frac <- sprintf('%s/%s',sum(SMART_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                             (sum(SMART_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(SMART_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(SMART_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(SMART_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))

STEP_emp_rec_serv_Perc <- paste0(round((sum(STEP_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) /
                             (sum(STEP_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(STEP_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)) * 100, digits = 0), '%')

STEP_emp_rec_serv_Frac <- sprintf('%s/%s',sum(STEP_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE),
                             (sum(STEP_Emp$`Strongly.Agree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Agree.-.I.will.recommend.your.services.to.others.`,na.rm = TRUE) +
                              sum(STEP_Emp$`Neither.Agree.nor.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) + sum(STEP_Emp$`Somewhat.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE) +
                              sum(STEP_Emp$`Strongly.Disagree.-.I.will.recommend.your.services.to.others.`, na.rm = TRUE)))



#################### FINAL

First <- c("", "", 'NoRTEC Satisfaction Survey Results',"","","","","","","","","")  
Second <- c("","", 'July 1, 2018 through June 30, 2019',"","","","","","","","","")    
Third <- c("","", 'NoRTEC', "", 'AFWD', "", 'JTC', "", 'SMART', "", 'STEP', "")
Fourth <- c("", "",'Percent Positive', 'Fraction','Percent Positive', 'Fraction','Percent Positive', 'Fraction','Percent Positive', 'Fraction',
            'Percent Positive', 'Fraction')
Fifth <- c('Walk-In Clients',"","","","","","","","","","","")
Sixth <- c("",'Overall, I am satisfied with the service(s) I received', NoRTEC_Service_Perc, NoRTEC_Service_Frac, AFWD_Service_Perc, AFWD_Service_Frac,
           JTC_Service_Perc, JTC_Service_Frac, SMART_Service_Perc, SMART_Service_Frac, STEP_Service_Perc, STEP_Service_Frac)
Seventh <- c("", "Staff responded to my needs in a timely manner", NoRTEC_St_Resp_Perc, NoRTEC_St_Resp_Frac, AFWD_St_Resp_Perc, AFWD_St_Resp_Frac,
             JTC_St_Resp_Perc, JTC_St_Resp_Frac, SMART_St_Resp_Perc, SMART_St_Resp_Frac, STEP_St_Resp_Perc, STEP_St_Resp_Frac)
Eight <- c("","Staff treated me courteously", NoRTEC_St_Curt_Perc, NoRTEC_St_Curt_Frac, AFWD_St_Curt_Perc, AFWD_St_Curt_Frac, JTC_St_Curt_Perc, JTC_St_Curt_Frac,
           SMART_St_Curt_Perc, SMART_St_Curt_Frac, STEP_St_Curt_Perc, STEP_St_Curt_Frac)
Ninth <- c("", "Staff helped me clearly understand the services available", NoRTEC_St_Help_Perc, NoRTEC_St_Help_Frac, AFWD_St_Help_Perc, AFWD_St_Help_Frac, 
           JTC_St_Help_Perc, JTC_St_Help_Frac, SMART_St_Help_Perc, SMART_St_Help_Frac, STEP_St_Help_Perc, STEP_St_Help_Frac)
Tenth <- c("", "I will recommend your services to others", NoRTEC_Rec_Others_Perc, NoRTEC_Rec_Others_Frac, AFWD_Rec_Others_Perc, 
            AFWD_Rec_Others_Frac, JTC_Rec_Others_Perc, JTC_Rec_Others_Frac, SMART_Rec_Others_Perc, SMART_Rec_Others_Frac, STEP_Rec_Others_Perc, STEP_Rec_Others_Frac)
######Enrolled Clients
Eleventh <- c("Enrolled Clients", "","","","","","","","","","","")
Twelfth <- c("", "I am satisfied with the services I received", NoRTEC_sat_serv_Perc, NoRTEC_sat_serv_Frac, AFWD_sat_serv_Perc, AFWD_sat_serv_Frac, JTC_sat_serv_Perc, 
             JTC_sat_serv_Frac, SMART_sat_serv_Perc, SMART_sat_serv_Frac, STEP_sat_serv_Perc, STEP_sat_serv_Frac)
Thirteenth <- c("", "Services were convenient to use", NoRTEC_conv_use_Perc, NoRTEC_conv_use_serv_Frac, AFWD_conv_use_Perc, AFWD_conv_use_serv_Frac, JTC_conv_use_Perc, 
                JTC_conv_use_serv_Frac, SMART_conv_use_Perc, SMART_conv_use_serv_Frac, STEP_conv_use_Perc, STEP_conv_use_serv_Frac)
Fourteenth <- c("", "Staff was knowledgeable and professional", NoRTEC_Know_Perc,NoRTEC_Know_serv_Frac, AFWD_Know_serve_Perc, AFWD_Know_serv_Frac, JTC_Know_serv_Perc, JTC_Know_serv_Frac, 
                SMART_Know_Perc, SMART_Know_serv_Frac, STEP_Know_Perc, STEP_Know_serv_Frac)
Fifteenth <- c("", "Staff listened to my needs", NoRTEC_Staff_List_Perc, NoRTEC_Staff_List_Frac, AFWD_Staff_List_Perc, AFWD_Staff_List_Frac, JTC_Staff_List_Perc, JTC_Staff_List_Frac, 
               SMART_Staff_List_Perc, SMART_Staff_List_Frac, STEP_Staff_List_Perc, STEP_Staff_List_Frac)
Sixteenth <- c("", "Staff responded to my questions in a timely manner", NoRTEC_Staff_Resp_Perc , NoRTEC_Staff_Resp_Frac,  AFWD_Staff_Resp_Perc, AFWD_Staff_Resp_Frac, JTC_Staff_Resp_Perc, 
               JTC_Staff_Resp_Frac, SMART_Staff_Resp_Perc, SMART_Staff_Resp_Frac, STEP_Staff_Resp_Perc, STEP_Staff_Resp_Frac)
Eighteenth <- c("", "The information I received was clear", NoRTEC_info_clear_Perc, NoRTEC_info_clear_Frac, AFWD_info_clear_Perc, AFWD_info_clear_Frac, JTC_info_clear_Perc, 
                JTC_info_clear_Frac, SMART_info_clear_Perc, SMART_info_clear_Frac, STEP_info_clear_Perc, STEP_info_clear_Frac)
Nineteenth <- c("", "I will recommend your services to others", NoRTEC_rec_serv_Perc, NoRTEC_rec_serv_Frac, AFWD_rec_serv_Perc, AFWD_rec_serv_Frac, JTC_rec_serv_Perc, JTC_rec_serv_Frac, 
                SMART_rec_serv_Perc, SMART_rec_serv_Frac, STEP_rec_serv_Perc, STEP_rec_serv_Frac)
######Businesses
Twentieth <- c("Employers","","","","","","","","","","","")
Twentyfirst <- c("", "I am satisfied with the services I received", NoRTEC_emp_sat_serv_Perc, NoRTEC_emp_sat_serv_Frac, AFWD_emp_sat_serv_Perc, AFWD_emp_sat_serv_Frac, JTC_emp_sat_serv_Perc, JTC_emp_sat_serv_Frac, 
                 SMART_emp_sat_serv_Perc, SMART_emp_sat_serv_Frac, STEP_emp_sat_serv_Perc, STEP_emp_sat_serv_Frac)
Twentysecond <- c("", "Services were convenient to use", NoRTEC_serv_conv_Perc, NoRTEC_serv_conv_Frac, AFWD_serv_conv_Perc, AFWD_serv_conv_Frac, JTC_serv_conv_Perc, JTC_serv_conv_Frac, 
                  SMART_serv_conv_Perc, SMART_serv_conv_Frac, STEP_serv_conv_Perc, STEP_serv_conv_Frac)
Twentythird <- c("", "Staff was knowledgeable and professional", NoRTEC_staff_know_Perc, NoRTEC_staff_know_Frac, AFWD_staff_know_Perc, AFWD_staff_know_Frac, JTC_staff_know_Perc , 
                 JTC_staff_know_Frac, SMART_staff_know_Perc, SMART_staff_know_Frac, STEP_staff_know_Perc, STEP_staff_know_Frac)
Twentyfourth <- c("", "Staff listened to my needs", NoRTEC_emp_staff_list_Perc, NoRTEC_emp_staff_list_Frac, AFWD_emp_staff_list_Perc, AFWD_emp_staff_list_Frac, JTC_emp_staff_list_Perc, JTC_emp_staff_list_Frac, 
                  SMART_emp_staff_list_Perc, SMART_emp_staff_list_Frac, STEP_emp_staff_list_Perc, STEP_emp_staff_list_Frac)
Twentyfifth <- c("","Staff responded to my questions in a timely manner", NoRTEC_emp_staff_resp_Perc, NoRTEC_emp_staff_resp_Frac, AFWD_emp_staff_resp_Perc, AFWD_emp_staff_resp_Frac, JTC_emp_staff_resp_Perc, 
                 JTC_emp_staff_resp_Frac, SMART_emp_staff_resp_Perc, SMART_emp_staff_resp_Frac, STEP_emp_staff_resp_Perc, STEP_emp_staff_resp_Frac)
Twentysixth <- c("", "The information I received was clear", NoRTEC_emp_info_clear_Perc, NoRTEC_emp_info_clear_Frac, AFWD_emp_info_clear_Perc, AFWD_emp_info_clear_Frac, JTC_emp_info_clear_Perc, JTC_emp_info_clear_Frac,
                 SMART_emp_info_clear_Perc, SMART_emp_info_clear_Frac, STEP_emp_info_clear_Perc, STEP_emp_info_clear_Frac)
Twenthseventh <- c("", "I will recommend your services to others", NoRTEC_emp_rec_serv_Perc, NoRTEC_emp_rec_serv_Frac, AFWD_emp_rec_serv_Perc, AFWD_emp_rec_serv_Frac, JTC_emp_rec_serv_Perc, JTC_emp_rec_serv_Frac, 
                   SMART_emp_rec_serv_Perc,SMART_emp_rec_serv_Frac, STEP_emp_rec_serv_Perc, STEP_emp_rec_serv_Frac)

Final <- rbind(First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eight, Ninth, Tenth, Eleventh, Twelfth, Thirteenth, Fourteenth, Fifteenth, Sixteenth, Eighteenth, Nineteenth, Twentieth,
               Twentyfirst, Twentysecond, Twentythird, Twentyfourth, Twentyfifth, Twentysixth, Twenthseventh)  

write.xlsx(Final,"FINAL_Survey_18_19(1).xlsx")   

