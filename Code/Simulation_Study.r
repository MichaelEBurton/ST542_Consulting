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

Fval_trt <- numeric()
Fval_int <- numeric()
Pval_trt<- numeric()
Pval_int<- numeric()

n <- nrow(interaction_data)
set.seed(252)
for(i in 1:1000){
  # Bootstrap
  pairs <- sample(1:36, size = 36,replace = TRUE)
  
  df_pairs <- unique(pairs) - 1
  df_error <- 71 - 5 - 5 - 1 - df_pairs
  
  # You need to be sure to select both datapoints from the 
  indices <- c(2*pairs, (2*pairs) - 1)
  
  # Seize the Data
  boot.dat <- simulation_data[indices,]
  
  lin_mod <- lmer(tinv ~ trt + arow + trt*arow + (1 | apair), data = boot.dat)
  results <- anova(lin_mod)
  Fval_trt[i] <- results$`F value`[1]
  Fval_int[i] <- results$`F value`[3]
  Pval_trt[i] <- pf(Fval_trt[i], 1, 5)
  Pval_int[i] <- pf(Fval_int[i], 5, df_error)
  
}

boxplot(Pval_trt, main = "P-values: Treatment Effect df1 = 1, df2 = 5")
boxplot(Pval_int, main = "P-values: Interaction Effect df1 = 5, df2 = N")
