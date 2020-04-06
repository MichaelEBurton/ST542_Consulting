################################
# Linear Model for data 
################################

y
raw_activity
# Using y data, 0 for control, 1 for sample
trt <- rep(c(0,1),36)
activity1 <- c(y[,1],y[,2],y[,3],y[,4],y[,5],y[,6],y[,7],y[,8],y[,9],y[,10],y[,11],y[,12])
row <-c(rep(1,12),rep(2,12),rep(3,12),rep(4,12),rep(5,12),rep(6,12))
pair <- rep(1:36,rep(2,36))
moddat1 <- data.frame(cbind(trt,activity1,row,pair))

#Linear model fitting activity as response (not sure if I set this up right), trt as 0 or 1 for 
#control or sample, row added as a variable with values 1:6, and pairs 1:36 as a random effect
lin.mod1 <- lmer(activity1~ trt + row + trt:row + (1 | pair),data = moddat1)
summary(lin.mod1)
anova(lin.mod1)
#Using raw_activity data (combined sample control)  
#activity <- c(raw_activity[,1],raw_activity[,2],raw_activity[,3],raw_activity[,4],raw_activity[,5],raw_activity[,6])
#activity

#row <-c(rep(1,6),rep(2,6),rep(3,6),rep(4,6),rep(5,6),rep(6,6))
#pair <- c(seq(1, 36, by=1))

#moddat <- data.frame(cbind(activity,row,pair))

