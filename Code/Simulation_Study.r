##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script will be used to determine the sample size for an         #  
##     experiment testing the ability of a mixed effects model to capture #
##     the effect size of interest.                                       #
##   Since there is no closed form way to calculate sample size necessary #
##     to achieve a certain statistical power we will perform a           #
##     simulation.
##                                                                        #  
## Assumptions:                                                           #      
##   The model will need to control for:                                  #  
##     > Row Effect   (fixed)                                             #
##     > Pair Effect (random)                                             #
##     > Operator Effect (random)                                         #
##     > Day-to-day Effect (random)                                       #
##                                                                        #         
## Authors: Michael Burton (meburton@ncsu.edu)                            #  
##          Anna Tomkins (actomkin@ncsu.edu)                              #
## Edited: 3/18/2020                                                      #   
##------------------------------------------------------------------------#
require(lme4)
require(dplyr)
simulation_data <- dplyr::arrange(interaction_data, apair)

Fval <- numeric()
n <- nrow(interaction_data)
set.seed(252)
for(i in 1:1000){
  # Bootstrap
  pairs <- sample(1:36, size = 36,replace = TRUE)
  
  # You need to be sure to select both datapoints from the 
  indices <- c(2*pairs, (2*pairs) - 1)
  
  # Seize the Data
  boot.dat <- simulation_data[indices,]
  
  lin_mod <- lmer(tinv ~ trt + (1 | arow), data = boot.dat)
  results <- anova(lin_mod)
  Fval[i] <-results$`F value`
}

boxplot(Fval)
