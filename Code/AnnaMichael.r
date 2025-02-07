library(tidyverse)

dat %>% pluck(2)
dat[[1]] 
unwind_activity
dat[[1]]  -> times

y.row <- as.factor(rep(1:6,each=6))
y.row 
as.data.frame(resp=c(y[seq(1,72,by=2)],y[seq(2,72,by=2)]),trt=as.factor(rep(c("control","sample"),each=36)) -> assay.data
)
as.data.frame(resp=c(y[seq(1,72,by=2)],y[seq(2,72,by=2)]),trt=as.factor(rep(c("control","sample"),each=36))) -> assay.data
cbind(resp=c(y[seq(1,72,by=2)],y[seq(2,72,by=2)]),trt=as.factor(rep(c("control","sample"),each=36))) 
as.data.frame(cbind(resp=c(y[seq(1,72,by=2)],y[seq(2,72,by=2)]),trt=as.factor(rep(c("control","sample"),each=36)))) -> assay.df
assay.df
assay.df
y[1:10]
assay.df %>% head

rep(rep(1:6,each=6),times=2) 

assay.df %>% mutate(arow=as.factor(rep(rep(1:6,each=6),times=2))) -> assay.df

assay.df %>% mutate(apair=as.factor(rep(1:36,each=2))) -> assay.df

assay.df %>% select(-apair) -> assay.df2
 
assay.df %>% select(-apair) -> assay.df

assay.df %>% mutate(apair=as.factor(rep(1:36,times=2))) -> assay.df

attach(assay.df)
interaction.plot(trt,apair,resp,data=assay.df)
lm(resp~trt+(1|apair))
lmer(resp~trt+(1|apair))
library(lme4)
lmer(resp~trt+(1|apair))
anova(lmer(resp~trt+(1|apair)))
is.factor(trt)
lmer(resp~as.factor(trt)+(1|apair))
lm.out <- lmer(resp~as.factor(trt)+(1|apair))
anova(lm.out) 
names(lm.out) 
str(lm.out) 
? lmer
attr(lm.out) 
dim(lm.out) 
summary(lm.out) 
assay.df %>% head
boxplot(assay.df$resp~arow)
assay.df %>% filter(trt==1) %>% select(resp,arow) %>% boxplot(arow)
assay.df %>% filter(trt==1) %>% select(resp,arow) %>% boxplot(resp~arow)
assay.df %>% filter(trt==1) %>% select(resp,arow) %>% tmp.df
assay.df %>% filter(trt==1) %>% select(resp,arow) -> tmp.df
tmp.df
boxplot(tmp.df$resp~tmp.df$arow)
assay.df %>% filter(trt==2) %>% select(resp,arow) -> tmp.df2
boxplot(tmp.df2$resp~tmp.df2$arow)
tmp.df2
tmp.df2 %>% head
assay.df %>% head
assay.df %>% filter(trt==2) %>% head
y
#as.data.frame(cbind(resp=c(y[seq(1,72,by=2)],y[seq(2,72,by=2)]),trt=as.factor(rep(c("control","sample"),each=36)))) -> assay.df
y
y[c(1,3,5)]
t(y)[c(1,3,5)]
assay.df %>% mutate(resp=c(t(y)[seq(1,72,by=2)],t(y)[seq(2,72,by=2)])) -> assay.df2
assay.df2 
assay.df2  %>% head
y %>% head
assay.df %>% filter(trt==2) %>% select(resp,arow) -> tmp.df2
assay.df %>% mutate(resp=c(t(y)[seq(1,72,by=2)],t(y)[seq(2,72,by=2)])) -> assay.df
assay.df %>% filter(trt==2) %>% select(resp,arow) -> tmp.df2
assay.df %>% filter(trt==1) %>% select(resp,arow) -> tmp.df1
boxplot(tmp.df2$resp~tmp.df2$arow)
boxplot(tmp.df1$resp~tmp.df2$arow)
par(mfrow=c(1,2))
boxplot(tmp.df1$resp~tmp.df2$arow)
boxplot(tmp.df2$resp~tmp.df2$arow)
plot(tmp.df2$resp,tmp.df1$resp)
par(mfrow=c(1,1))
plot(tmp.df1$resp,tmp.df2$resp)
plot(tmp.df2$resp~tmp.df2$resp  )
plot(tmp.df1$resp,tmp.df2$resp,pch=rep(1:6,each=6))
plot(tmp.df1$resp,tmp.df2$resp,col=rep(1:6,each=6))
plot(tmp.df1$resp,tmp.df2$resp,col=rep(1:6,each=6),pch=8)
plot(tmp.df1$resp,tmp.df2$resp,col=rep(1:6,each=6),pch=7)
plot(tmp.df1$resp,tmp.df2$resp,col=rep(1:6,each=6),pch=5)
plot(tmp.df1$resp,tmp.df2$resp,col=rep(1:6,each=6),pch=6)
plot(tmp.df1$resp,tmp.df2$resp,col=rep(1:6,each=6),pch=19)
legend(1:6,10,5.8,col=1:6)
legend(10,5.8,col=1:6)
legend(1:6,10,5.8,col=1:6)
? legend
legend(10,5.8,1:6,col=1:6)
legend(10,5.8,1:6,col=1:6,pch=19)
plot(tmp.df2$resp~tmp.df2$resp  )
plot(tmp.df2$resp,tmp.df2$resp  )
plot(tmp.df2$resp,tmp.df1$resp  )
plot(tmp.df1$resp,tmp.df2$resp  )
y
plot(tmp.df1$resp,tmp.df2$resp,col=rep(1:6,each=6),pch=19)
plot(1/tmp.df1$resp,1/tmp.df2$resp,col=rep(1:6,each=6),pch=19)
lm.pairs <- lmer(1/resp ~ trt + (1|pair),data=assay.df)
assay.df %>% head
lm.pairs <- lmer(1/resp ~ trt + (1|apair),data=assay.df)
summary(lm.pairs) 
plot(lm.pairs) 
interaction.plot(trt,apair,1/resp,data=assay.df)
y
1/y
100/y
attach(assay.df)
apair
rm(apair)
rm(arow)
rm(resp)
rm(trt)
attach(assay.df)
interaction.plot(trt,apair,1/resp,data=assay.df)
? interaction.plot
assay.df %>% filter(arow==1) 
assay.df %>% filter(arow==1)  %>% mutate(tinv=1/resp) %>% select(response=tinv,trt,trace=apair) %>% interaction.plot
assay.df %>% filter(arow==1)  %>% mutate(tinv=1/resp) %>% select(response=tinv,trt,trace.factor=apair) %>% interaction.plot
assay.df %>% filter(arow==1)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) %>% interaction.plot
assay.df %>% filter(arow==1)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) assay.row1
assay.df %>% filter(arow==1)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) -> assay.row1
assay.row1
interaction.plot(trt=trt,trace.factor=apair,resp=tinv)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,data=assay.row1)
attach(assay.row1)
detach(assay.df)
attach(assay.row1)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2,lty=1:6)
assay.df %>% filter(arow==2)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) -> assay.row2
assay.df %>% filter(arow==3)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) -> assay.row3
assay.df %>% filter(arow==4)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) -> assay.row4
assay.df %>% filter(arow==5)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) -> assay.row5
assay.df %>% filter(arow==6)  %>% mutate(tinv=1/resp) %>% select(trt,apair,tinv) -> assay.row6
par(mfrow=c(2,3))
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2,lty=1:6)
attach(assay.row2)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2,lty=1:6)
attach(assay.row3)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2,lty=1:6)
attach(assay.row4)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2,lty=1:6)
attach(assay.row5)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2,lty=1:6)
attach(assay.row6)
interaction.plot(x.factor=trt,trace.factor=apair,resp=tinv,col=1:6,lwd=2,lty=1:6)
y
y[5,]
1/y[5,]
#lm.pairs <- lmer(1/resp ~ trt + (1|apair),data=assay.df)
#lm.pairs.rows <- lmer(1/resp ~ trt + (1|apair/) + (1|arow),data=assay.df)
lm.pairs.rows <- lmer(1/resp ~ trt + (1|arow) + (1|apair/arow) ,data=assay.df)
lm.pairs.rows <- lmer(1/resp ~ trt + (1|apair/arow) ,data=assay.df)
summary(lm.pairs.rows) 
lm.pairs.rows <- lmer(1/resp ~ trt + (1|arow) ,data=assay.df)
lm.pairs.rows 
summary(lm.pairs.rows )
anova(lm.pairs.rows )
summary(lm.pairs)
summary(lm.pairs.rows )
anova(lm.pairs.rows )
lm.pairs.rows <- lmer(1/resp ~ trt + (1|arow/apair) ,data=assay.df)
summary(lm.pairs.rows) 
lm.pairs.rows <- lmer(1/resp ~ trt + (1|as.factor(arow)/as.factor(apair)) ,data=assay.df)
assay.df
attach(assay.df)
as.factor(assay.df$apair)
lm.pairs.rows <- lmer(1/resp ~ trt + as.factor(arow)/as.factor(apair) ,data=assay.df)
lm.pairs.rows <- lm(1/resp ~ trt + as.factor(arow)/as.factor(apair) ,data=assay.df)
anova(lm.pairs.rows) 
lm.pairs <- lm(1/resp ~ trt + as.factor(apair) ,data=assay.df)
anova(lm.pairs) 

