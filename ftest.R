library(MASS)
Boston
full=lm(medv~rm+crim+lstat,data=Boston)
reduced =lm(medv~rm, data=Boston)
anova(reduced,full)

