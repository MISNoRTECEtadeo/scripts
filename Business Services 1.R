"S:\Esteban\Reports Service Provider Requested"

library(tidyverse)
#install.packages("readxl")
library("readxl")
library('dplyr')
library(openxlsx)

setwd("S:/Esteban/Reports Service Provider Requested")

#Bring in All data for businesses served 7/1/18-6/30/2019
Data_bus_2 <- read_xlsx("Business Services AFWD.xlsx", sheet = "Raw_Data")

#Count of all businesses
x <- dim(Data_bus_2)
#Also Count of all
Count_All_Businesses <- Data_bus_2 %>%
  count()
#Distinct Businesses
Count_Distinct_Businesses <- Data_bus_2 %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY))
sum(Count_Distinct_Businesses$count)

#Count AFWD
AFWD <- Data_bus_2 %>%
  filter(AGENCY == "AFWD")

unique(AFWD, COMPANY, STAFF)

sum(AFWD$count)

write.xlsx(AFWD, file = "AFWD.xlsx",colNames = FALSE, borders = "columns")

#count by service office
Chico_2 <- Data_bus_2 %>%
  filter(`SERVICE OFFICE` == "NOR AFWD Butte County - Chico") %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY))
sum(Chico_2$count)

Oroville_2 <- Data_bus_2 %>%
  filter(`SERVICE OFFICE` == "NOR AFWD Butte County - Oroville") %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY))
sum(Oroville_2$count)

AFWD_Services <- Data_bus_2 %>%
  filter(AGENCY == "AFWD") %>% 
  filter(CATEGORY == "a. employer information and support")

#Count Distinct Service in AFWD Employer Info. and Support group
AFWD_A_Bus <- AFWD_Services %>%
  group_by(COMPANY) %>%
  summarise(count=n_distinct(COMPANY))
sum(Data_bus_2$count)


