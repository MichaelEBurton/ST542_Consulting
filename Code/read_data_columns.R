##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to read in the data from the carbonic            #     
##     anhydrase analytical assay, and process the data for analysis.     #  
##                                                                        #  
## Assumptions:                                                           #      
##   We assume that the relevant data will always fall between the        #     
##     range B89 to CU169.                                                #     
##                                                                        #         
## Authors: Michael Burton (meburton@ncsu.edu)                            #  
##          Anna Tomkins (actomkin@ncsu.edu)                              #
## Edited: 2/12/2020                                                      #   
##------------------------------------------------------------------------#

# + Set your working directory to the directory that contains the data
# + Specify name of data file
# + Specify range of cells to extract data from

setwd("C:\\Users\\mburt\\Downloads")

fname <- "20200207_121325 CA-TB demo 80k Dilution 10 min incubation.xlsx"

drange <- "B89:CU169"

processed <- process_machine_data(filename = fname, data_range = drange, exclude_first_two = FALSE)

dat <- processed[[1]]

dat <-  dat[,-c(3:14)]

y <- processed[[2]][-c(1,2),]

colMeans(y)

control <- y[,seq(1,11,2)]
sample <- y[,seq(2,12,2)]

sample.means <- rowMeans(sample)
control.means <- rowMeans(control)
sample.means - control.means

raw_activity <- (1/sample - 1/control) * 1000
raw_activity
rowMeans(raw_activity) # Enzyme appears to be less active towards the end
colMeans(raw_activity) # Activity doesnt vary much across rows

setwd('~/Repos/ST542_Consulting/')



