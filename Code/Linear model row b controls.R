# Linear model for row by col effect only using controls in row B 

interaction_data$arow <- as.factor(c(rep(1,6),rep(2,6),rep(3,6),rep(4,6),rep(5,6),rep(6,6),rep(7,6)))

#with interaction
lin_mod1 <- lm(tinv ~ trt + arow + acol+arow:acol, data = interaction_data)
results1 <- anova(lin_mod1)
results1

#without interaction
lin_mod2 <- lm(tinv ~ trt + arow + acol, data = interaction_data)
results2 <- anova(lin_mod2)
results2
