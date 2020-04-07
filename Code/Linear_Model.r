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

# Not sure if this is right? Does anova give us the correct F-values?
F_trt <- results$`Mean Sq`[1]/results$`Mean Sq`[3]
F_row <- results$`Mean Sq`[2]/results$`Mean Sq`[3]
F_int <- results$`F value`[3]

p_trt <- 1 - pf(F_trt, df1 = 1, df2 = 5)
p_row <- 1 - pf(F_row, df1 = 1, df2 = 5)
p_int <- 1 - pf(F_int, df1 = 5, df2 = 25)

confint(lin_mod)*1000
# Calculate the Correct Standard errors, not entirely sure how to go about this?
#lin_mod <- lme(tinv ~ trt + arow + arow:trt ,
#               random = ~ apair ,
#               data = interaction_data)
#
#fixed.effects(lin_mod)
