##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to create plots to explore the data from the     #     
##     carbonic assay experiment on Feburary 7th, 2020                    #  
##                                                                        #                                                 #     
##                                                                        #         
## Author: Michael Burton (meburton@ncsu.edu)                             #         
## Edited: 2/13/2020                                                      #   
##------------------------------------------------------------------------#
require(ggplot2)
require(dplyr)

#========================================================
## S Curves
S_curve_by_row(dat, "C")

#========================================================
## Boxplots
ctrl <- dplyr::arrange(reshape2::melt(control), Var1)
ctrl[,2] <- "Control"
ctrl[,4] <- paste0(ctrl[,2],ctrl[,1])
colnames(ctrl) <- c("Row", "Column", "Value", "id")


samp <- dplyr::arrange(reshape2::melt(sample), Var1)
samp[,2] <- "Sample"
samp[,4] <- paste0(samp[,2],samp[,1])
colnames(samp) <- c("Row", "Column", "Value", "id")

box_by_row <- dplyr::arrange(rbind(ctrl,samp), Row)

ggplot(data = box_by_row) + 
  geom_boxplot(aes(x = id, y =Value, color = id)) + 
  xlab("Row & Specimen Id") +
  ylab("Time to baseline (.2)") + 
  theme_bw()

#===================================================
#Variance of control vs sample
box_by_row %>% group_by(id) %>% summarise(Variance = sd(Value)^2)

#===================================================
## Unit Activity over time
get_vectored <- unwind(raw_activity)


x <- 1:36
fit <- lm(get_vectored ~ x)
b0 <- fit$coefficients[1]
b1 <- fit$coefficients[2]

plot(fit)

plot(1:36, get_vectored, type = "l", lwd = 2, 
     main = "Raw Unit Activity over Time", xlab = "Well Order",
     ylab = "Raw Unit Activity")
abline(b0, b1, col = 'red', lwd = 2)
# trend line doesn't change much when well 25 is removed

acf(get_vectored)

