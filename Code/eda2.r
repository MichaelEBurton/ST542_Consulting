##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to create plots to explore the data from the     #     
##     carbonic assay experiment on Feburary 7th, 2020                    #  
##                                                                        #                                                 #     
##                                                                        #         
## Author: Michael Burton (meburton@ncsu.edu)                             #         
## Edited: 2/13/2020                                                      #   
##------------------------------------------------------------------------#

S_curve_by_row(dat, "C")

get_vectored <- unwind_activity(raw_activity)


x <- 1:36
fit <- lm(get_vectored ~ x)
b0 <- fit$coefficients[1]
b1 <- fit$coefficients[2]

plot(fit)

plot(1:36, get_vectored, type = "l", 
     main = "Raw Unit Activity over Time", xlab = "Well Order",
     ylab = "Raw Unit Activity")
abline(b0, b1)
# trend line doesn't change much when well 25 is removed

acf(get_vectored)

