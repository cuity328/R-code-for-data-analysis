library(MASS)
Boston
output=lm(medv~age+rm+lstat,data=Boston)
summary(output)
reduced =lm(medv~rm+lstat, data=Boston)
anova(reduced,output)
