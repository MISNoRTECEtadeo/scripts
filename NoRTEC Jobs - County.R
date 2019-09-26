
#install.packages("tidyverse")
library(tidyverse)
#install.packages("readxl")
library("readxl")
library('dplyr')
library(openxlsx)
library(plotrix)


setwd("S:/Esteban/NoRTEC Jobs Export")

#Data from CalJOBS
NoRTEC_Jobs_Data <- read_xlsx("Jobs-Export-2019-August-13-1839.xlsx")

NoRTEC_Jobs_Data_Filt <- NoRTEC_Jobs_Data %>%
  filter(Date > '2019-01-01')
NoRTEC_Jobs <- nrow(NoRTEC_Jobs_Data_Filt)

Unique_Businesses_NoRTEC <- distinct(NoRTEC_Jobs_Data_Filt,`_employer_name`)
NoRTEC_Unique_Businesses <- nrow(Unique_Businesses_NoRTEC)

NoRTEC_Healthcare <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Healthcare")

NoRTEC_Manufacturing <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Manufacturing")

NoRTEC_Retail <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Retail")

NoRTEC_Construction <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Construction")

NoRTEC_Other <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Other")

NoRTEC_Government <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Government")

NoRTEC_Education <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Education")

NoRTEC_Agriculture <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Agriculture")

NoRTEC_Driver <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Driver")

NoRTEC_Financial <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Financial")

NoRTEC_Customer_Service <- NoRTEC_Jobs_Data_Filt %>%
  filter(`Job Sector` == "Customer Service")



#############
Butte <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Butte")
Jobs_Butte <- nrow(Butte)
Butte_Health <- Butte %>%
  filter(`Job Sector` == "Healthcare")
Butte_Healthcare <- nrow(Butte_Health)
Butte_Manufacturing <- Butte %>%
  filter(`Job Sector` == "Manufacturing")
Butte_Manufacturing <- nrow(Butte_Manufacturing)
Butte_other <- Butte %>%
  filter(`Job Sector` == "Other")
Butte_other <- nrow(Butte_other)

Nevada <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Nevada")
Jobs_Nevada <- nrow(Nevada)
Nevada_Health <- Nevada %>%
  filter(`Job Sector` == "Healthcare")
Nevada_Healthcare <- nrow(Butte_Health)
Nevada_Manufacturing <- Nevada %>%
  filter(`Job Sector` == "Manufacturing")
Nevada_Manufacturing <- nrow(Nevada_Manufacturing)
Nevada_other <- Nevada %>%
  filter(`Job Sector` == "Other")
Nevada_other <- nrow(Nevada_other)

Shasta <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Shasta")
Jobs_Shasta <- nrow(Shasta)
Shasta_Health <- Shasta %>%
  filter(`Job Sector` == "Healthcare")
Shasta_Healthcare <- nrow(Shasta_Health)
Shasta_Manufacturing <- Shasta %>%
  filter(`Job Sector` == "Manufacturing")
Shasta_Manufacturing <- nrow(Shasta_Manufacturing)
Shasta_other <- Shasta %>%
  filter(`Job Sector` == "Other")
Shasta_other <- nrow(Shasta_other)

Tehama <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Tehama")
Jobs_Tehama<- nrow(Tehama)

Plumas <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Plumas")
Jobs_Plumas<- nrow(Plumas)

Sierra <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Sierra|Sierra" | `_job_county` == "Sierra")
Jobs_Sierra<- nrow(Sierra)

Lassen <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Lassen")
Jobs_Lassen<- nrow(Lassen)

Modoc <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Modoc")
Jobs_Modoc<- nrow(Modoc)

Trinity <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Trinity")
Jobs_Trinity<- nrow(Trinity)

DelNorte <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Del Norte")
Jobs_Del_Norte<- nrow(DelNorte)

Siskiyou <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Siskiyou")
Jobs_Siskiyou<- nrow(Siskiyou)

Other <- NoRTEC_Jobs_Data_Filt %>%
  filter(`_job_county` == "Other" | `_job_county` == "Glenn" | `_job_county` == "Humboldt")
Jobs_Other<- nrow(Other)

First <- c("NoRTEC", "Butte", "Nevada", "Shasta", "Tehama", "Plumas", "Sierra","Lassen", "Modoc", "Trinity", "Del Norte", "Siskiyou", "Other")
Second <- c(NoRTEC_Jobs, Jobs_Butte, Jobs_Nevada, Jobs_Shasta, Jobs_Tehama, Jobs_Plumas, Jobs_Sierra, Jobs_Lassen, Jobs_Modoc, Jobs_Trinity, 
            Jobs_Del_Norte, Jobs_Siskiyou, Jobs_Other)
Third <- c("NoRTEC Unique Businesses", NoRTEC_Unique_Businesses, "","","","","","","","","","","")

Jobs_FINAL <- rbind(First, Second, Third)

write.xlsx(Jobs_FINAL, file = "Jobs_FINAL.xlsx", colNames = FALSE, borders = "columns")


#######
library(plotly)
library(png)

Table_Jobs <- data.frame(First, Second)

p <- plot_ly(Table_Jobs, x = ~First, y = ~Second, type = 'bar', name = 'NoRTEC Jobs By County') %>%
  add_trace(y = ~Second, name = 'Job Orders') %>%
  layout(yaxis = list(title = 'Count'), barmode = 'stack')



## Sector Graph

Sectors <- c("Healthcare Jobs", "Manufacturing", "Other")
Butte_Sector <- c(Butte_Healthcare, Butte_Manufacturing, Butte_other) 
Nevada_Sector <- c(Nevada_Healthcare, Nevada_Manufacturing, Nevada_other)
Shasta_Sector <- c(Shasta_Healthcare, Shasta_Manufacturing, Shasta_other)
Sector_table <- data.frame(Sectors, Butte_Sector, Nevada_Sector, Shasta_Sector)

HTML_Jobs_Chart <- plot_ly(Sector_table, x = ~Sectors, y = ~Butte_Sector, type = 'bar', name = 'Butte') %>%
  add_trace(y = ~Nevada_Sector, name = 'Nevada') %>%
  add_trace(y = ~Shasta_Sector, name = 'Shasta') %>%
  layout(yaxis = list(title = 'Count of Job Orders from NoRTEC Jobs'), barmode = 'stack')

######################
Bar<- c(NoRTEC_Jobs, Jobs_Butte, Jobs_Nevada, Jobs_Shasta)

# Simple Pie Chart
#slices <- c(Jobs_Butte, Jobs_Nevada,Jobs_Shasta)
#lbls <- c("Butte", "Nevada", "Shasta")
#pie(slices, labels = lbls, main="Pie Chart of Counties")


slices <- c(Jobs_Butte, Jobs_Nevada,Jobs_Shasta)
lbls <- c("Butte", "Nevada", "Shasta")
pie3D(slices,labels=lbls,explode=0.1,
      main="Job Orders by County")

counts <- table(Bar)
barplot(counts, main="NoRTEC Jobs", 
        xlab="Counties)

barplot(Bar,
main = "NoRTEC Jobs",
xlab = "County",
ylab = "Jobs",
names.arg = c("NoRTEC", "Butte", "Nevada", "Shasta"),
col = rainbow(4),
horiz = FALSE)

