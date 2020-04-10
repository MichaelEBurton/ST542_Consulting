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

################################################################
# This is what I changed to just use the controls for the top row, I eliminated the row and pair column since we don't need it?
L <- c(y[1,], y[2,],y[3,],y[4,], y[5,], y[6,])

response <- c(L[seq(1,72,by=2)],L[seq(2,72,by=2)])
tinv <- 1/response
trt <- as.factor(rep(c("control", "sample"), each = 36))
arow <- as.factor(rep.int(rep(1:6, each = 6), times = 2))
apair <- as.factor(rep.int(1:36, times = 2))

interaction_data <- cbind.data.frame(response, tinv, trt, arow,apair)
interaction_data <- dplyr::filter(interaction_data, trt != 'control')
interaction_data['acol'] <- as.factor(rep.int(seq(2,12,2), times = 6))
interaction_data <- interaction_data[,-c(4,5)]

response <- processed[[2]][2,seq(2,12,2)]
trt <- rep('control', 6)
tinv <- 1/response
acol <- seq(2,12,2)
controls <- cbind.data.frame(response, tinv, trt, acol)

interaction_data <- rbind.data.frame(controls,interaction_data)
