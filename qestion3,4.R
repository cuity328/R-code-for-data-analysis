install.packages("copula")
library(copula)
data(rdj)
returndata=data.matrix(rdj[2:4])
uvalue=pobs(returndata)
mplfitc=fitCopula(claytonCopula(dim=3),uvalue,method="mpl")
outmplc=summary(mplfitc)
outmplc
tau(claytonCopula(outmplc$coef[1],dim=3))

mplfitk=fitCopula(frankCopula(dim=3),uvalue,method="mpl")
outmplk=summary(mplfitk)
outmplk
tau(frankCopula(outmplk$coef[1],dim=3))

INTCGEdata=returndata[,c(1,3)]
uvalue2=pobs(INTCGEdata)
mplfitg=fitCopula(gumbelCopula(dim=2),uvalue2,method="mpl")
outmplg=summary(mplfitg)
outmplg
tau(gumbelCopula(outmplg$coef[1],dim=2))