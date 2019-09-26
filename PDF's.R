library(tidyverse)
install.packages("pdftools")
library(pdftools)
library(dplyr)

setwd("S:/Esteban/Regionalism")

files <- list.files(pattern = "pdf$")

Regional_Plan <- pdf_text("https://www.ncen.org/images/documents/plan/WIOA%20Regional%20Plan.pdf", opw = "", upw = "") 


Regional_Sector_Pathways <- cat(Regional_Plan[23:29])
readr::read_lines(Regional_Sector_Pathways[10])

pdf_subset('https://www.ncen.org/images/documents/plan/WIOA%20Regional%20Plan.pdf',
           pages = 23:29, output = "Regional_Sector_Pathways.pdf")
pdf_length("Regional_Sector_Pathways.pdf")
