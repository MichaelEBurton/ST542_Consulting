##------------------------------------------------------------------------#
## Purpose:                                                               #
##   This script is used to create plots to explore the data from the     #     
##     carbonic assay experiment on Feburary 7th, 2020                    #  
##                                                                        #                                                      
##                                                                        #         
## Author: Michael Burton (meburton@ncsu.edu)                             #         
## Edited: 2/13/2020                                                      #   
##------------------------------------------------------------------------#
require(ggplot2)
require(dplyr)

#========================================================
## S Curves
S_curve_by_row(dat, "C")

#========================================================
## Boxplots
ctrl <- dplyr::arrange(reshape2::melt(control), Var1)
ctrl[,2] <- "Control"
ctrl[,4] <- paste0(ctrl[,2],ctrl[,1])
ctrl[,5] <- rep(c(seq(1,11,2)), times = 6)
ctrl[,6] <- paste0(ctrl[,2],ctrl[,5])
colnames(ctrl) <- c("Row", "Trt", "Value", "rid", "Column", "cid")


samp <- dplyr::arrange(reshape2::melt(sample), Var1)
samp[,2] <- "Sample"
samp[,4] <- paste0(samp[,2],samp[,1])
samp[,5] <- rep(c(seq(2,12,2)), times = 6)
samp[,6] <- paste0(samp[,2],samp[,5])
colnames(samp) <- c("Row", "Trt", "Value", "rid", "Column", "cid")

box_by_row <- dplyr::arrange(rbind(ctrl,samp), Row) 

# Boxplot by row and trt
ggplot(data = box_by_row) + 
  geom_boxplot(aes(x = rid, y =Value, color = rid)) + 
  xlab("Row & Specimen Id") +
  ylab("Time to baseline (.2)") + 
  theme_bw()

# Boxplot by column
ggplot(data = box_by_row) + 
  geom_boxplot(aes(x = cid, y =Value, color = cid)) + 
  xlab("Column & Specimen Id") +
  ylab("Time to baseline (.2)") + 
  theme_bw()

#===================================================
#Variance of control vs sample
box_by_row %>% group_by(id) %>% summarise(Variance = sd(Value)^2)

#===================================================
## Unit Activity over time
get_vectored <- unwind(raw_activity)


x <- 1:36
fit <- lm(get_vectored ~ x)
b0 <- fit$coefficients[1]
b1 <- fit$coefficients[2]

plot(fit)

plot(1:36, get_vectored, type = "l", lwd = 2, 
     main = "Raw Unit Activity over Time", xlab = "Well Order",
     ylab = "Raw Unit Activity")
abline(b0, b1, col = 'red', lwd = 2)
# trend line doesn't change much when well 25 is removed
#==============================================================
## Interaction Plots
L <- c(y[1,], y[2,],y[3,],y[4,], y[5,], y[6,])
response <- c(L[seq(1,72,by=2)],L[seq(2,72,by=2)])
tinv <- 1/response
trt <- as.factor(rep(c("control", "sample"), each = 36))
arow <- as.factor(rep.int(rep(1:6, each = 6), times = 2))
apair <- as.factor(rep.int(1:36, times = 2))

interaction_data <- cbind.data.frame(response, tinv, trt, arow,apair)

attach(interaction_data)

interaction.plot(x.factor = trt, trace.factor = apair, response = tinv)

detach(interaction_data)


g <- ggplot(data = interaction_data)
g + 
  geom_line(aes(y = tinv, x = trt, group = apair),color = apair, size = 1.2) + 
  facet_grid(cols = vars(arow)) + 
  scale_colour_manual(values = c("yellow", "black", "green", "blue", "cyan", "red")) +
  xlab(label = "Control vs. Sample by Row") +
  ylab(label = "Time Inverse") +
  theme_bw()

#=====================================================================
## Formal testing paired t-test, Mixed Model
Y <- interaction_data[1:36,2]
X <- interaction_data[37:72,2]

t.test(x = X, y = Y, paired = TRUE, var.equal = FALSE)


require(lme4)

lin_mod <- lmer(tinv ~ trt + (1 | apair), data = interaction_data)
anova(lin_mod)




























