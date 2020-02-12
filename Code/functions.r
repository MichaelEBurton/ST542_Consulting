process_machine_data <- function(filename, data_range){
  
  output <- list()
  
  data <- readxl::read_xlsx(filename, col_names = TRUE, range = data_range,
                            progress = readxl::readxl_progress())
  
  data_condensed <- dat[, which(! colnames(dat) %in% colnames(dat)[3:26])]
  
  colnames(data_condensed)[1:2] <- c("Time", "Temp")
  
  output[[1]] <- data_condensed
  
  ##############
  ## Time stuff
  
  return(output)
}


# + Create a function
#     - Calculates the time it takes a well to lower to an optical
#       density of .2 or less.
#     - Input: vector x containing the measurements of OD

TimeCalc <- function(x){
  index <- which(x < .2)[1]
  time <- dat_condensed$Time[index]
  return(time)
}


fname <- "20200207_121325 CA-TB demo 80k Dilution 10 min incubation.xlsx"
drange <- "B89:CU169"