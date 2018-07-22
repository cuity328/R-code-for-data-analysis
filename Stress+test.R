install.packages("readxl")
library(readxl)
data=read_excel("SpanishBanksRatios.xlsx",col_types="numeric")
data2=data[c(2,4,29,30,35,45,47),]
data2=subset(data2,select=-c(1,3,4))
subdata=t(data2)
a=c('Bank','ROE','PM','NII','TDTA','LOGTD','LOGEQ')
colnames(subdata)=a
subdata=as.data.frame(subdata[-1,])
rownames(subdata) <- NULL
subdata=na.omit(subdata)
subdata$LOGEQ=log(subdata$LOGEQ)
subdata$LOGTD=log(subdata$LOGTD)
head(subdata)


mylogit=glm(Bank~ROE+PM+NII+TDTA+LOGTD+LOGEQ,data=subdata,family="binomial")
summary(mylogit)
confint(mylogit)
confint.default(mylogit)
exp(coef(mylogit))
# odds ratios and 95% CI
exp(cbind(OR=coef(mylogit),confint.default((mylogit))))
# test with probit regression
myprobit=glm(Bank~ROE+PM+NII+TDTA+LOGTD+LOGEQ,family=binomial(link="probit"),data=subdata)
summary(myprobit)
confint(myprobit)
