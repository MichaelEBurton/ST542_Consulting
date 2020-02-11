# Create graphs
require(reshape2)
require(dplyr)
require(stringr)
require(ggplot2) 


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
