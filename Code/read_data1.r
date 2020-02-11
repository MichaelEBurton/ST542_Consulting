setwd("C:\\Users\\mburt\\Downloads")

require(readxl)

dat <- read_xlsx("20200207_121325 CA-TB demo 80k Dilution 10 min incubation.xlsx",
                  col_names = TRUE, range = "B89:CU169",
                  progress = readxl_progress())

