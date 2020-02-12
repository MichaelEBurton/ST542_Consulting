##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to create plots to explore the data from the     #     
##     carbonic assay experiment on Feburary 7th, 2020                    #  
##                                                                        #                                                 #     
##                                                                        #         
## Author: Michael Burton (meburton@ncsu.edu)                             #         
## Edited: 2/11/2020                                                      #   
##------------------------------------------------------------------------#

S_curve_by_row(dat, "C")

get_vectored <- numeric(0)
i <- 1
while(i < 6){
  j <- 1
  while(j < 7){
    get_vectored <- rbind(get_vectored, activity[i,j])
    j <- j + 1
  }
  i <- i + 1
  if(i == 7 ){
    break
   }
  j <- 6
  while(j > 0){
    get_vectored <- rbind(get_vectored, activity[i,j])
    j <- j - 1
  }
  i <- i + 1
}


x <- 1:36
fit <- lm(get_vectored ~ x)
b0 <- fit$coefficients[1]
b1 <- fit$coefficients[2]

plot(1:36, get_vectored, type = "l", 
     main = "Raw Unit Activity over Time", xlab = "Well Order",
     ylab = "Raw Unit Activity")
abline(b0, b1)

acf(get_vectored)
