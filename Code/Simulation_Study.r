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
## Edited: 3/13/2020                                                      #   
##------------------------------------------------------------------------#
