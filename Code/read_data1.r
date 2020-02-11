##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to read in the data from the carbonic            #     
##     anhydrase analytical assay, and process the data for analysis.     #  
##                                                                        #  
## Assumptions:                                                           #      
##   We assume that the relevant data will always fall between the        #     
##     range B89 to CU169.                                                #     
##                                                                        #         
## Author: Michael Burton (meburton@ncsu.edu)                             #         
## Edited: 2/11/2020                                                      #   
##------------------------------------------------------------------------#

# + Set your working directory to the directory that contains the data
#
# + Load the appropriate packages

#setwd("C:\\Users\\mburt\\Downloads")

require(readxl)

# + Read in the data using the readxl::read_xlsx() function
#     - Be sure to specify the range of the cells containing the data
#     - Specify that the first column contains the column names
#     - Include a progress bar for fun!
#
# + Rename the first two columns to elminate spaces in the name
#
# + Condense the Data to elminate the first two rows

dat <- read_xlsx("20200207_121325 CA-TB demo 80k Dilution 10 min incubation.xlsx",
                  col_names = TRUE, range = "B89:CU169",
                  progress = readxl_progress())

colnames(dat)[1:2] <- c("Time", "Temp")

dat_condensed <- dat[, which(! colnames(dat) %in% colnames(dat)[3:26])]

# + Create a function
#     - Calculates the time it takes a well to lower to an optical
#       density of .2 or less.
#     - Input: vector x containing the measurements of OD

TimeCalc <- function(x){
  index <- which(x < .2)[1]
  time <- dat_condensed$Time[index]
  return(time)
}

x <- apply(dat_condensed[,3:74], MARGIN = 2, FUN = TimeCalc)

y <- matrix(x, nrow = 6, ncol = 12,byrow = T)

colMeans(y)

control <- cbind(y[,1],y[,3],y[,5],y[,7],y[,9],y[,11])
sample <- cbind(y[,2],y[,4],y[,6],y[,8],y[,10],y[,12])

sample.means <- rowMeans(sample)
control.means <- rowMeans(control)
sample.means - control.means

activity <- (1/sample - 1/control) * 1000
activity
rowMeans(activity)
