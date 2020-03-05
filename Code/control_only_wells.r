setwd("C:\\Users\\mburt\\Downloads")

fname <- "20200217_153436 ST team Tris control only all 96-well tested 200 cycles.xlsx"

drange <- "B79:CU279"

processed <- process_machine_data(filename = fname, data_range = drange, exclude_first_two = FALSE)

get_vectored <- unwind(processed[[2]], rows = 8, cols = 12)

x <- 1:96
fit <- lm(get_vectored ~ x)
b0 <- fit$coefficients[1]
b1 <- fit$coefficients[2]


plot(x, get_vectored, type = "l", lwd = 2, 
     main = "Time to 0.2 O.D. 200 Cycles", xlab = "Well Order",
     ylab = "Time", ylim = c(6,13))
abline(b0, b1, col = 'red', lwd = 2)

S_curve_by_row(processed[[1]], "A")
S_curve_by_row(processed[[1]], "H")
###########################################################################################################

fname <- "20200217_174400 ST team Tris control only all 96-well tested 80 cycles co2 OK.xlsx"

drange <- "B79:CU279"

processed <- process_machine_data(filename = fname, data_range = drange, exclude_first_two = FALSE)

get_vectored <- unwind(processed[[2]], rows = 8, cols = 12)

x <- 1:96
fit <- lm(get_vectored ~ x)
b0 <- fit$coefficients[1]
b1 <- fit$coefficients[2]


plot(x, get_vectored, type = "l", lwd = 2, 
     main = "Time to 0.2 O.D. 80 Cycles", xlab = "Well Order",
     ylab = "Time", ylim = c(6,13))
abline(b0, b1, col = 'red', lwd = 2)


##############################################################################################################
fname <- "20200218_145519 ST team Tris control only all 96-well tested 120 cycles.xlsx"

drange <- "B79:CU279"

processed <- process_machine_data(filename = fname, data_range = drange, exclude_first_two = FALSE)

get_vectored <- unwind(processed[[2]], rows = 8, cols = 12)

x <- 1:96
fit <- lm(get_vectored ~ x)
b0 <- fit$coefficients[1]
b1 <- fit$coefficients[2]


plot(x, get_vectored, type = "l", lwd = 2, 
     main = "Time to 0.2 O.D. 120 Cycles", xlab = "Well Order",
     ylab = "Time", ylim = c(6,13))
abline(b0, b1, col = 'red', lwd = 2)
 
