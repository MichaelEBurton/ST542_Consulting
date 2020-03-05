#####################################################
# ST 542 
# T test to test significance between row effects

#####################################################

x <- raw_activity
rowMeans(x)
#rownames(x) <- c("c","d","e","f","g","h")
x <- t(x)
x
rbind(c('c',x[1,1]),c("c",x[1,2]),c("c",x[1,3]),c("c",x[1,4]),c("c",x[1,5]),c("c",x[1,6]),
      c('d',x[2,1]),c("d",x[2,2]),c("d",x[2,3]),c("d",x[2,4]),c("d",x[2,5]),c("d",x[2,6]))
row <- c('c','c','c','c','c','c','d','d','d','d','d','d','e','e','e','e','e','e','f','f','f','f','f','f','g','g','g','g','g','g','h','h','h','h','h','h')
length(row)
act <- c(x[1,1],x[1,2],x[1,3],x[1,4],x[1,5],x[1,6],
         x[2,1],x[2,2],x[2,3],x[2,4],x[2,5],x[2,6],
         x[3,1],x[3,2],x[3,3],x[3,4],x[3,5],x[3,6],
         x[4,1],x[4,2],x[4,3],x[4,4],x[4,5],x[4,6],
         x[5,1],x[5,2],x[5,3],x[5,4],x[5,5],x[5,6],
         x[6,1],x[6,2],x[6,3],x[6,4],x[6,5],x[6,6])
act
xp <- cbind(row,act)
colnames(xp) <- c("row", "activity")
xp

xp <- as.data.frame(xp)
xp

xp$row <- as.factor(xp$row)
xp$activity <- as.numeric(xp$activity)

xp.out <- lm(xp$activity ~ xp$row)
anova(xp.out)
