install.packages("plm")
library(plm)
FinalDF=readRDS(file="FinalDF.rds")
fixed=plm(LERW~GDP+LSTK+VGDP+IHHI+FHHI+ECI+GGI,data=FinalDF,index=c("Country","Year"),model="within")
summary(fixed)
summary(fixef(fixed))

fixedpool=plm(LERW~GDP+LSTK+VGDP+IHHI+FHHI+ECI+GGI,data=FinalDF,
               index=c("Country","Year"),model="pooling")
pFtest(fixed, fixedpool)
fixedvol=plm(LERW~GDP+LSTK+VGDP+IHHI+FHHI+ECI+GGI+IVOL ,data=FinalDF,index=c("Country","Year"),model="within")
summary(fixedvol)

randomeff=plm(LERW~GDP+LSTK+GEO+VGDP+IHHI+FHHI+ECI+GGI ,data=FinalDF,index=c("Country","Year"),model="random")
summary(randomeff)

rf=plm(LERW~GDP+LSTK+VGDP+IHHI+FHHI+ECI+GGI ,data=FinalDF,index=c("Country","Year"),model="random")
phtest(fixed,rf)

#Copula
install.packages("copula")
library(copula)
fdata=readRDS(file="fdata.rds")
uvalue=pobs(fdata)
mplfitc=fitCopula(claytonCopula(dim=3),uvalue,method="mpl")
outmplc=summary(mplfitc)
tau(claytonCopula(outmplc$coef[1],dim=3))

mplfitg=fitCopula(gumbelCopula(dim=3),uvalue,method="mpl")
outmplg=summary(mplfitg)
tau(gumbelCopula(outmplg$coef[1],dim=3))

mplfitk=fitCopula(frankCopula(dim=3),uvalue,method="mpl")
outmplk=summary(mplfitk)
tau(frankCopula(outmplk$coef[1],dim=3))
