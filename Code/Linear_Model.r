##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script will be used to fit the linear model we have chosen      #
##   as well as calculate all confidence intervals and p-values for the   #
##   the effects we are interested in.                                    #
##                                                                        #  
##                                                                        #         
## Authors: Michael Burton (meburton@ncsu.edu)                            #  
## Edited: 4/3/2020                                                       #   
##------------------------------------------------------------------------#

# First we remove everything in the global environment

rm(list = ls(all.names = TRUE))

# Change the working directory and exceute all scripts we depend on. 
setwd('~/Repos/ST542_Consulting/')
source('Code/functions.r')
source('Code/read_data1.r')
source('Code/eda2.r')


require(lme4)

lin_mod <- lmer(tinv ~ trt + arow + arow:trt + (1 | apair), data = interaction_data)
results <- anova(lin_mod)
<<<<<<< HEAD

interaction.plot(x.factor = interaction_data$trt, trace.factor = interaction_data$arow, response = interaction_data$tinv,
                 xlab = "Treatment", ylab = "Mean of 1/time to reach O.D. 0.2")
=======
sum <- summary(lin_mod)
ranef(lin_mod)$apair
#purely Fixed effects model
aov (tinv ~ trt + arow + arow:trt,data = interaction_data)
>>>>>>> 90bfbcb2dfc7781ec1006b4eded9533f1c73d758
# Not sure if this is right? Does anova give us the correct F-values?
F_trt <- results$`Mean Sq`[1]/results$`Mean Sq`[3]
F_row <- results$`Mean Sq`[2]/results$`Mean Sq`[3]
F_int <- results$`F value`[3]

p_trt <- 1 - pf(F_trt, df1 = 1, df2 = 5)
p_row <- 1 - pf(F_row, df1 = 1, df2 = 5)
p_int <- 1 - pf(F_int, df1 = 5, df2 = 25)

<<<<<<< HEAD
confint(lin_mod) * 1000
# Calculate the Correct Standard errors, not entirely sure how to go about this?
#lin_mod <- lme(tinv ~ trt + arow + arow:trt ,
#               random = ~ apair ,
#               data = interaction_data)
#
#fixed.effects(lin_mod)
=======
confint(lin_mod)*1000


vcov <- vcov(lin_mod)
vcov
vtrtsample <-  vcov[2,2]
vtrt.row2 <-  vcov[2,2] +  vcov[8,8] - 2* vcov[2,8]
vtrt.row3 <-  vcov[2,2] +  vcov[9,9] - 2* vcov[2,9]
vtrt.row4 <-  vcov[2,2] +  vcov[10,10] - 2* vcov[2,10]
vtrt.row5 <-  vcov[2,2] +  vcov[11,11] - 2* vcov[2,11]
vtrt.row6 <-  vcov[2,2] +  vcov[12,12] - 2* vcov[2,12]
conf.vars <- c(vtrtsample,vtrt.row2,vtrt.row3,vtrt.row4,vtrt.row5,vtrt.row6)

trtsample.est <- 0.062928
etrt.row2 <- trtsample.est + -0.0008462
etrt.row3 <- trtsample.est + -0.0084233
etrt.row4 <- trtsample.est + -0.0200338
etrt.row5 <- trtsample.est + -0.0240518
etrt.row6 <- trtsample.est + -0.0228936
conf.est <- c(trtsample.est,etrt.row2,etrt.row3,etrt.row4,etrt.row5,etrt.row6)

conf.int.lower<- c(conf.est - 1.84*sqrt(conf.vars))
conf.int.upper<- c(conf.est + 1.84*sqrt(conf.vars))
conf.int.upper
confidenceint <- data.frame(conf.est,conf.vars,conf.int.lower,conf.int.upper)
rownames(confidenceint) <- c("Row 1","Row 2","Row 3","Row 4","Row 5","Row 6")
colnames(confidenceint) <- c("Activity estimate", "Variance", "lower CI", "upper CI")
confidenceint

>>>>>>> 90bfbcb2dfc7781ec1006b4eded9533f1c73d758
