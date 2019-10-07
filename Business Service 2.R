library(tidyverse)
#install.packages("readxl")
library("readxl")
library('dplyr')
library(openxlsx)

setwd("S:/Esteban/NoRTEC Performance/2019-2020 Q1/Business_Services")

########SERVICEOFFICE should have space like SERVICE OFFICE in script below.

#Bring in All data for businesses served 7/1/18-6/30/2019
Data_bus <- read_xlsx("Business_Services.xlsx", sheet = "ALL")

#Count of all NoRTEC businesses
NoRTEC_Business_Services <- Data_bus %>%
  filter(CATEGORY != "other" & CATEGORY != "f. incumbent worker training")
NoRTEC_All_Business_Services <- nrow(NoRTEC_Business_Services)

#Distinct Businesses NoRTEC
Count_NoRTEC_Distinct_Businesses <- Data_bus %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
NoRTEC_Uniq_Businesses <- sum(Count_NoRTEC_Distinct_Businesses$count)

#Count all Employer Info. and Support Services NoRTEC
NoRTEC_Emp_Info_Support <- Data_bus %>%
  filter(CATEGORY == "a. employer information and support")
NoRTEC_All_Employers_Info_Support <- nrow(NoRTEC_Emp_Info_Support)

#Unique Employer Info. and Support Services NoRTEC
NoRTEC_UNiq_Emp_Info_Support <- Data_bus %>%
  filter(CATEGORY == "a. employer information and support") %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
NoRTEC_Emp_Info_Support_Sum <- sum(NoRTEC_UNiq_Emp_Info_Support$count)

#Count all Workforce Recruitment Assistance NoRTEC
NoRTEC_Work_Recruit_Support <- Data_bus %>%
  filter(CATEGORY == "b. workforce recruitment")
NoRTEC_Work_Recruit_Sum <- nrow(NoRTEC_Work_Recruit_Support)

#Workforce Recruitment Assistance NoRTEC
NoRTEC_work_recruit_asst <- Data_bus %>%
  filter(CATEGORY == "b. workforce recruitment") %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
NoRTEC_Work_Recruit_Asst_Sum <- sum(NoRTEC_work_recruit_asst$count)

#Count strategic planning/econ. development" NoRTEC
NoRTEC_SUM_strategic_planning <- Data_bus %>%
  filter(CATEGORY == "c. strategic planning/econ. development")
NoRTEC_SUM_strategic_plan <- nrow(NoRTEC_SUM_strategic_planning)

#strategic planning/econ. development NoRTEC
NoRTEC_strategic_planning <- Data_bus %>%
  filter(CATEGORY == "c. strategic planning/econ. development") %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
NoRTEC_strategic_plan_Uniq <- sum(NoRTEC_strategic_planning$count)

#Count d. untapped labor pools NoRTEC
NoRTEC_SUM_untapped_labor_pools <- Data_bus %>%
  filter(CATEGORY == "d. untapped labor pools")
NoRTEC_SUM_untap_labor_pools <- nrow(NoRTEC_SUM_untapped_labor_pools)

#d. untapped labor pools NoRTEC 
NoRTEC_untapped_labor_pool <- Data_bus %>%
  filter(CATEGORY == "d. untapped labor pools") %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
NoRTEC_untapped_labor_pool_Uniq <- sum(NoRTEC_untapped_labor_pool$count)

#Count e. training services NoRTEC
NoRTEC_SUM_training_services <- Data_bus %>%
  filter(CATEGORY == "e. training services")
NoRTEC_SUM_train_services <- nrow(NoRTEC_SUM_training_services)

#Unique Businesses e. training services NoRTEC
NoRTEC_training_services <- Data_bus %>%
  filter(CATEGORY == "e. training services") %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
NoRTEC_Uniq_train_services <- sum(NoRTEC_training_services$count)

#Count g. rapid response/downsizing assistance
NoRTEC_SUM_rapid_response <- Data_bus %>%
  filter(CATEGORY == "g. rapid response/downsizing assistance")
NoRTEC_SUM_rapid_response <- nrow(NoRTEC_SUM_rapid_response)

#g. rapid response/downsizing assistance NoRTEC
NoRTEC_training_services <- Data_bus %>%
  filter(CATEGORY == "g. rapid response/downsizing assistance") %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
NoRTEC_Uniq_Rapid_Resp <- sum(NoRTEC_training_services$count)

######################Count ALL Business services
AFWD <- Data_bus %>%
  filter(AGENCY == "AFWD" & CATEGORY != "other" & CATEGORY != "f. incumbent worker training") 
AFWD_All_Bus_Serve <-nrow(AFWD)
  
SMART <- Data_bus %>%
  filter(AGENCY == "SMART") 
SMART_All_Bus_Serve <-nrow(SMART)

STEP <- Data_bus %>%
  filter(AGENCY == "STEP") 
STEP_All_Bus_Serve <-nrow(STEP)

JTC <- Data_bus %>%
  filter(AGENCY == "JTC") 
JTC_All_Bus_Serve <- nrow(JTC)

AFWD_Uniq <- Data_bus %>%
  filter(AGENCY == 'AFWD') %>%
group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
AFWD_Uniq_Bus_Served <- sum(AFWD_Uniq$count)

SMART_Uniq <- Data_bus %>%
  filter(AGENCY == 'SMART') %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
SMART_Uniq_Bus_Served <- sum(SMART_Uniq$count)

STEP_Uniq <- Data_bus %>%
  filter(AGENCY == 'STEP') %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
STEP_Uniq_Bus_Served <- sum(STEP_Uniq$count)

JTC_Uniq <- Data_bus %>%
  filter(AGENCY == 'JTC') %>%
  group_by(COMPANY) %>% 
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
JTC_Uniq_Bus_Served <- sum(JTC_Uniq$count)

######### Employer Info. and Support group

AFWD_employer_information_support <- Data_bus %>%
  filter(AGENCY == "AFWD" & CATEGORY == "a. employer information and support") 
AFWD_Emp_Info_ALL <- nrow(AFWD_employer_information_support)

SMART_employer_information_support <- Data_bus %>%
  filter(AGENCY == "SMART" & CATEGORY == "a. employer information and support") %>%
  group_by(COMPANY) 
SMART_Emp_Info_ALL <- nrow(SMART_employer_information_support)

STEP_employer_information_support <- Data_bus %>%
  filter(AGENCY == "STEP" & CATEGORY == "a. employer information and support") %>%
  group_by(COMPANY) 
STEP_Emp_Info_ALL <- nrow(STEP_employer_information_support)

JTC_employer_information_support <- Data_bus %>%
  filter(AGENCY == "JTC" & CATEGORY == "a. employer information and support") %>%
  group_by(COMPANY) 
JTC_Emp_Info_ALL <- nrow(JTC_employer_information_support)

#Unique Info & Support

AFWD_A_Bus <- AFWD_employer_information_support %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
AFWD_Uniq_Emp_Info <- sum(AFWD_A_Bus$count)

SMART_Unique_employer_information_support <- SMART_employer_information_support %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
SMART_Uniq_Emp_Info <- sum(SMART_Unique_employer_information_support$count)

STEP_Unique_employer_information_support <- STEP_employer_information_support %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
STEP_Uniq_Emp_Info <- sum(STEP_Unique_employer_information_support$count)

JTC_Unique_employer_information_support <- JTC_employer_information_support %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
JTC_Uniq_Emp_Info <- sum(JTC_Unique_employer_information_support$count)

#Count of AFWD "b. workforce requitment Assistance"

AFWD_Workforce_Recruitment <- Data_bus %>%
  filter(AGENCY == "AFWD" & CATEGORY == "b. workforce recruitment") %>%
  group_by(COMPANY) 
AFWD_Workforce_Recruitment_Sum <- nrow(AFWD_Workforce_Recruitment)

SMART_Workforce_Recruitment <- Data_bus %>%
  filter(AGENCY == "SMART" & CATEGORY == "b. workforce recruitment") %>%
  group_by(COMPANY) 
SMART_Workforce_Recruitment_Sum <- nrow(SMART_Workforce_Recruitment)

STEP_Workforce_Recruitment <- Data_bus %>%
  filter(AGENCY == "STEP" & CATEGORY == "b. workforce recruitment") %>%
  group_by(COMPANY) 
STEP_Workforce_Recruitment_Sum <- nrow(STEP_Workforce_Recruitment)

JTC_Workforce_Recruitment <- Data_bus %>%
  filter(AGENCY == "JTC" & CATEGORY == "b. workforce recruitment") %>%
  group_by(COMPANY) 
JTC_Workforce_Rec <- nrow(JTC_Workforce_Recruitment)

#Uniq Workfore Recruitment
AFWD_Unique_Workforce_Recruitment <- AFWD_Workforce_Recruitment %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
AFWD_Uniq_Workforce_Rec <- sum(AFWD_Unique_Workforce_Recruitment$count)

SMART_Unique_Workforce_Recruitment <- SMART_Workforce_Recruitment %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
SMART_Uniq_Workforce_Rec <- sum(SMART_Unique_Workforce_Recruitment$count)

STEP_Unique_Workforce_Recruitment <- STEP_Workforce_Recruitment %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
STEP_Uniq_Workforce_Rec <- sum(STEP_Unique_Workforce_Recruitment$count)

JTC_Unique_Workforce_Recruitment <- JTC_Workforce_Recruitment %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
JTC_Uniq_Workforce_Rec <- sum(JTC_Unique_Workforce_Recruitment$count)

#Count of AFWD "c. strategic planning/econ. development"

AFWD_Strategic_Planning <- Data_bus %>%
  filter(AGENCY == "AFWD" & CATEGORY == "c. strategic planning/econ. development") %>%
  group_by(COMPANY) 
AFWD_Strategic_Plan_All <- nrow(AFWD_Strategic_Planning)

SMART_Strategic_Planning <- Data_bus %>%
  filter(AGENCY == "SMART" & CATEGORY == "c. strategic planning/econ. development") %>%
  group_by(COMPANY) 
SMART_Strategic_Plan_All <- nrow(SMART_Strategic_Planning)

STEP_Strategic_Planning <- Data_bus %>%
  filter(AGENCY == "STEP" & CATEGORY == "c. strategic planning/econ. development") %>%
  group_by(COMPANY) 
STEP_Strategic_Planning_All <- nrow(STEP_Strategic_Planning)

JTC_Strategic_Planning <- Data_bus %>%
  filter(AGENCY == "JTC" & CATEGORY == "c. strategic planning/econ. development") %>%
  group_by(COMPANY) 
JTC_Strat_Plan <- nrow(JTC_Strategic_Planning)

#Uniq Strategic Planning

Unique_AFWD_Strategic_Planning <- AFWD_Strategic_Planning %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
AFWD_Uniq_Strat_Plan <- sum(Unique_AFWD_Strategic_Planning$count)

Unique_SMART_Strategic_Planning <- SMART_Strategic_Planning %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
SMART_Uniq_Strat_Plan <- sum(Unique_SMART_Strategic_Planning$count)

Unique_STEP_Strategic_Planning <- STEP_Strategic_Planning %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
STEP_Uniq_Strat_Plan <- sum(Unique_STEP_Strategic_Planning$count)

Unique_JTC_Strategic_Planning <- JTC_Strategic_Planning %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
JTC_Uniq_Strat_Plan <- sum(Unique_JTC_Strategic_Planning$count)

#Count of AFWD "d. untapped labor pools""

AFWD_untapped_labor_pools <- Data_bus %>%
  filter(AGENCY == "AFWD" & CATEGORY == "d. untapped labor pools") %>%
  group_by(COMPANY) 
AFWD_Untapped_Pool <- nrow(AFWD_untapped_labor_pools)

SMART_untapped_labor_pools <- Data_bus %>%
  filter(AGENCY == "SMART" & CATEGORY == "d. untapped labor pools") %>%
  group_by(COMPANY) 
SMART_Untapped_Pool <- nrow(SMART_untapped_labor_pools)

STEP_untapped_labor_pools <- Data_bus %>%
  filter(AGENCY == "STEP" & CATEGORY == "d. untapped labor pools") %>%
  group_by(COMPANY) 
STEP_Untapped_Pool <- nrow(STEP_untapped_labor_pools)

JTC_untapped_labor_pools <- Data_bus %>%
  filter(AGENCY == "JTC" & CATEGORY == "d. untapped labor pools") %>%
  group_by(COMPANY) 
JTC_Untapped_Pool <- nrow(JTC_untapped_labor_pools)

#Uniq Untapped Pool

Unique_AFWD_untapped_labor_pools <- AFWD_untapped_labor_pools %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_AFWD_untapped_labor_pools <- sum(Unique_AFWD_untapped_labor_pools$count)

Unique_SMART_untapped_labor_pools <- SMART_untapped_labor_pools %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_SMART_untapped_labor_pools <- sum(Unique_SMART_untapped_labor_pools$count)

Unique_STEP_untapped_labor_pools <- STEP_untapped_labor_pools %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_STEP_untapped_labor_pools <- sum(Unique_STEP_untapped_labor_pools$count)

Unique_JTC_untapped_labor_pools <- JTC_untapped_labor_pools %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
JTC_Uniq_Untapped_Pool <- sum(Unique_JTC_untapped_labor_pools$count)

#Count of AFWD "e. training services"

AFWD_training_services <- Data_bus %>%
  filter(AGENCY == "AFWD" & CATEGORY == "e. training services") %>%
  group_by(COMPANY) 
AFWD_train_services <- nrow(AFWD_training_services)

SMART_training_services <- Data_bus %>%
  filter(AGENCY == "SMART" & CATEGORY == "e. training services") %>%
  group_by(COMPANY) 
SMART_train_services <- nrow(SMART_training_services)

STEP_training_services <- Data_bus %>%
  filter(AGENCY == "STEP" & CATEGORY == "e. training services") %>%
  group_by(COMPANY) 
STEP_train_services <- nrow(STEP_training_services)

JTC_training_services <- Data_bus %>%
  filter(AGENCY == "JTC" & CATEGORY == "e. training services") %>%
  group_by(COMPANY) 
JTC_Train_Serve <- nrow(JTC_training_services)

#Uniq Training Services

Unique_AFWD_training_services <- AFWD_training_services %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_AFWD_train_services <- sum(Unique_AFWD_training_services$count) 

Unique_SMART_training_services <- SMART_training_services %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_SMART_train_services <- sum(Unique_SMART_training_services$count) 

Unique_STEP_training_services <- STEP_training_services %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_STEP_train_services <- sum(Unique_STEP_training_services$count) 

Unique_JTC_training_services <- JTC_training_services %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
JTC_Unique_Train_Serve <- sum(Unique_JTC_training_services$count) 

#Count of "g. rapid response/downsizing assistance"

AFWD_rapid_response_downsizing_assistance_all <- Data_bus %>%
  filter(AGENCY == "AFWD" & CATEGORY == "g. rapid response/downsizing assistance") %>%
  group_by(COMPANY) 
AFWD_rapid_response_downsizing_assistance <- nrow(AFWD_rapid_response_downsizing_assistance_all)

SMART_rapid_response_downsizing_assistance_all <- Data_bus %>%
  filter(AGENCY == "SMART" & CATEGORY == "g. rapid response/downsizing assistance") %>%
  group_by(COMPANY) 
SMART_rapid_response_downsizing_assistance <- nrow(SMART_rapid_response_downsizing_assistance_all)

STEP_rapid_response_downsizing_assistance_all <- Data_bus %>%
  filter(AGENCY == "STEP" & CATEGORY == "g. rapid response/downsizing assistance") %>%
  group_by(COMPANY) 
STEP_RAP <- nrow(STEP_rapid_response_downsizing_assistance_all)

JTC_rapid_response_downsizing_assistance_all <- Data_bus %>%
  filter(AGENCY == "JTC" & CATEGORY == "g. rapid response/downsizing assistance") %>%
  group_by(COMPANY) 
JTC_RAP <- nrow(JTC_rapid_response_downsizing_assistance_all)

#Uniq Rapid Response

Unique_AFWD_rapid_response_downsizing_assistance <- AFWD_rapid_response_downsizing_assistance_all %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_AFWD_rapid_response_downsizing_assistance <- sum(Unique_AFWD_rapid_response_downsizing_assistance$count) 

Unique_SMART_rapid_response_downsizing_assistance <- SMART_rapid_response_downsizing_assistance_all %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
Unique_SMART_rapid_response_downsizing_assistance <- sum(Unique_SMART_rapid_response_downsizing_assistance$count)

Unique_STEP_rapid_response_downsizing_assistance <- STEP_rapid_response_downsizing_assistance_all %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
STEP_Uniq_Rap <- sum(Unique_STEP_rapid_response_downsizing_assistance$count)

Unique_JTC_rapid_response_downsizing_assistance <- JTC_rapid_response_downsizing_assistance_all %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY,'SERVICE OFFICE'))
JTC_Uniq_Rap <- sum(Unique_JTC_rapid_response_downsizing_assistance$count)



####################### Final
First <- c("", "NoRTEC WIOA Employer Services Report","","","","","","","","","")
Second <- c("", "July 2019 through September 2019","","","","","","","","","")
Third <- c("", "NoRTEC","", "AFWD","", "SMART","", "STEP","", "JTC","")
Fourth <- c("", "Number of Employers", "Total Services","Number of Employers", "Total Services",
            "Number of Employers", "Total Services","Number of Employers", "Total Services",
            "Number of Employers", "Total Services")
Fifth <- c("Total Employers/Business Services", NoRTEC_Uniq_Businesses, NoRTEC_All_Business_Services, 
           AFWD_Uniq_Bus_Served,AFWD_All_Bus_Serve, SMART_Uniq_Bus_Served, SMART_All_Bus_Serve, STEP_Uniq_Bus_Served,
           STEP_All_Bus_Serve, JTC_Uniq_Bus_Served, JTC_All_Bus_Serve)
Sixth <- c("The number of services provided and employers that received:","","","","","","",
        "","","","")
Seventh <- c("Employer Information and Support Services", NoRTEC_Emp_Info_Support_Sum, NoRTEC_All_Employers_Info_Support, 
             AFWD_Uniq_Emp_Info, AFWD_Emp_Info_ALL, SMART_Uniq_Emp_Info, SMART_Emp_Info_ALL, STEP_Uniq_Emp_Info, STEP_Emp_Info_ALL,
             JTC_Uniq_Emp_Info, JTC_Emp_Info_ALL)
Eight <- c("Workforce Recruitment Assistance", NoRTEC_Work_Recruit_Asst_Sum, NoRTEC_Work_Recruit_Sum, AFWD_Uniq_Workforce_Rec,AFWD_Workforce_Recruitment_Sum,
           SMART_Uniq_Workforce_Rec, SMART_Workforce_Recruitment_Sum, STEP_Uniq_Workforce_Rec, STEP_Workforce_Recruitment_Sum, JTC_Uniq_Workforce_Rec,  
           JTC_Workforce_Rec)
Ninth <- c("Strategic Planning and Economic Development Support", NoRTEC_strategic_plan_Uniq, NoRTEC_SUM_strategic_plan, AFWD_Uniq_Strat_Plan, AFWD_Strategic_Plan_All,
           SMART_Uniq_Strat_Plan, SMART_Strategic_Plan_All, STEP_Uniq_Strat_Plan, STEP_Strategic_Planning_All, JTC_Uniq_Strat_Plan, JTC_Strat_Plan)
Tenth <- c("Assistance Accessing Untapped Labor Pools", NoRTEC_untapped_labor_pool_Uniq, NoRTEC_SUM_untap_labor_pools, Unique_AFWD_untapped_labor_pools, AFWD_Untapped_Pool, 
           Unique_SMART_untapped_labor_pools, SMART_Untapped_Pool, Unique_STEP_untapped_labor_pools, STEP_Untapped_Pool, JTC_Uniq_Untapped_Pool, JTC_Untapped_Pool) 
Eleventh <- c("Training Assistance Services", NoRTEC_Uniq_train_services, NoRTEC_SUM_train_services, Unique_AFWD_train_services, AFWD_train_services, Unique_SMART_train_services, 
              SMART_train_services, Unique_STEP_train_services, STEP_train_services, JTC_Unique_Train_Serve, JTC_Train_Serve)
Twelfth <- c("Rapid Response and Downsizing Services", NoRTEC_Uniq_Rapid_Resp, NoRTEC_SUM_rapid_response, Unique_AFWD_rapid_response_downsizing_assistance, AFWD_rapid_response_downsizing_assistance, 
             Unique_SMART_rapid_response_downsizing_assistance, SMART_rapid_response_downsizing_assistance, STEP_Uniq_Rap, STEP_RAP, JTC_Uniq_Rap, JTC_RAP) 	


FINAL_Business_Services <- rbind(First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eight, Ninth, Tenth, Eleventh, Twelfth)
 
write.xlsx(FINAL_Business_Services,file =  "Business_Services_19-20_Q1 (7-29-19).xlsx",colNames = TRUE)


