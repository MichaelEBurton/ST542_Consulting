##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to create plots to explore the data from the     #     
##     carbonic assay experiment on Feburary 7th, 2020                    #  
##                                                                        #                                                 #     
##                                                                        #         
## Author: Michael Burton (meburton@ncsu.edu)                             #         
## Edited: 2/11/2020                                                      #   
##------------------------------------------------------------------------#

# Load Required Packages

require(reshape2)
require(dplyr)
require(stringr)
require(ggplot2) 

# Melt the data
mdat <- melt(dat_condensed, id= c("Time", "Temp"))

filter_by_row <- function(row_letter, data){
  dat <- data %>% 
           dplyr::filter(substr(data$variable, 1,1) == row_letter)
  return(dat)
}

gdat <- filter_by_row("H", mdat)

g <- ggplot(data = gdat)
g <- g + geom_line(aes(x = Time, y = value, col = variable)) +
     geom_hline(aes(yintercept = 0.2))
g
