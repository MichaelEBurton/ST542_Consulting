##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to create functions used for tedious, repetitive #
##     tasks. Function documentation is included in each function.        #
##                                                                        #                 
##                                                                        #         
## Author: Michael Burton (meburton@ncsu.edu)                             #         
## Edited: 2/26/2020                                                      #   
##------------------------------------------------------------------------#


# Function for processing machine data

process_machine_data <- function(filename, data_range = "B89:CU169", exclude_first_two = TRUE){
  # Function Documentation:
  # This functions purpose is to read in the data from the excel files
  #  that are output from Dr. Salmon's optical density measuring
  #  machine. 
  #
  # Functionality: 
  # + Read in data from excel extracting only the data in the user specified range
  # + Exclude the data corresponding to the first two rows on the 96-well plate
  # + Calculate the time it takes a given well to drop to an optical density less
  #     than .2
  # + Return a matrix of the times in the same format as the well plate.
  #
  # Parameters:
  # * filename: The name of the excel file to read in. This function assumes that 
  #               your file is in the working directory; if not you can include the
  #               entire file path to this variable.
  #
  # * data_range: Valid range of cells in excel that you wish to extract. The default was
  #                 chosen based on what was observed for a few datasets.
  #
  
  # + Intialize a List to store contents to be returned when the function is called
  
  output <- list()
  
  # + Read in the data using the readxl::read_xlsx() function
  #     - Be sure to specify the range of the cells containing the data
  #     - Specify that the first column contains the column names
  #
  # + Rename the first two columns to elminate spaces in the name
  #
  # + Condense the Data to elminate the first two rows
  # + Rename the first two variables to eliminate spaces
  # + Save the time column as its own variable
  data <- readxl::read_xlsx(filename, col_names = TRUE, range = data_range,
                            progress = readxl::readxl_progress())
  if(exclude_first_two){
    
    data_condensed <- data[, which(! colnames(data) %in% colnames(data)[3:26])]
    apply_range <- 3:74
    row_n <- 6
    col_n <- 12
    
  } else {
    
    data_condensed <- data
    apply_range <- 3:98
    row_n <- 8
    col_n <- 12
  
  }
  
  colnames(data_condensed)[1:2] <- c("Time", "Temp")
  
  Time <- data_condensed$Time
  
  # + Save condensed data to the output list
  output[[1]] <- data_condensed
  
  # + Use apply to vectorize the process of calculating the time for the optical
  #      density to reach below .2
  # + Reshape the output from time into a matrix corresponding to 6 rows and 12 columns.
  #      this will match up with the plate used minus the first two columns
  # + Save y to the output list
  # + Return the output list
  x <- apply(data_condensed[,apply_range], MARGIN = 2, 
             FUN = function(x) Time[which(x < .2)[1]])
  
  y <- matrix(x, nrow = row_n, ncol = col_n,byrow = TRUE)
  
  output[[2]] <- y
  
  return(output)
}

# Function to generate graph by row

S_curve_by_row <- function(x, row_letter){
  # Function Documentation:
  # This functions purpose is to recreate the optical density over time graphs created 
  #   when running the experiment. This function will only graph by row
  #
  # Parameters:
  # * x: A data frame matrix containg the data in the format of the first list item from
  #        the process_machine_data function.
  #
  # * Row_Letter: Letter from C to H
  #
  
  # + Melt the data so it is in a skinny format. Where we have four columns:
  #     - Time
  #     - Temperature
  #     - Well indicator
  #     - Value of Optical Density
  #
  # + Subset the melted data to contain only those wells whose letter matches the 
  #     row letter indicator
  # + Create ggplot including a horizontal line at the Optical Density .2 cutoff.
  
  melted <- reshape2::melt(x, id= c("Time", "Temp"))
  
  data_to_graph <- dplyr::filter(melted, substr(melted$variable, 1,1) == toupper(row_letter))
  
  g <- ggplot2::ggplot(data = data_to_graph)
  
  g <- g + ggplot2::geom_line(ggplot2::aes(x = Time, y = value, 
                                           col = variable)) +
                    ggplot2::geom_hline(ggplot2::aes(yintercept = 0.2)) +
                    ggplot2::ylab("Optical Density") +
                    ggplot2::xlab("Time") +
                    ggplot2::ggtitle(paste0("Optical Density over Time for row"),
                                     toupper(row_letter))
  
  g
}

# Function to Unwind Activity Matrix
unwind <- function(x, rows = 6, cols = 6){
  # Unwinds any matrix from left to right, then down and right to left; continuing in a snake like pattern
  # Function Documentation:
  # This functions purpose is to unwind ant matrix that corresponds to a 96-well
  #  plate. For unwinding acitivties the default column and rows are 6. 
  #
  # Parameters:
  # * rows: Number of rows in your matrix
  #
  # * cols: Number of columns in your matrix

  get_vectored <- numeric(0)
  i <- 1
  while(i < rows){
    j <- 1
    while(j < cols + 1){
      get_vectored <- rbind(get_vectored, x[i,j])
      j <- j + 1
    }
    i <- i + 1
    if(i == cols + 1 ){
      break
    }
    j <- cols
    while(j > 0){
      get_vectored <- rbind(get_vectored, x[i,j])
      j <- j - 1
    }
    i <- i + 1
  }
  return(get_vectored)
}
