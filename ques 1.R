install.packages("quantmod")
require(quantmod)
##create a new enviornment
fb <- new.env()
getSymbols("FB", env = fb , src = "yahoo", from = as.Date("2015-01-01"), to = as.Date("2017-12-31"))
fbdata=fb$FB
fbdata
dailyclose=fbdata$FB.Close
logrdaily<- diff(log(Cl(dailyclose)))
logrdaily=na.omit(logrdaily)
install.packages("TSA")
require(TSA)
outfit=garch(x=logrdaily, order=c(0,1))
summary(outfit)
plot(resid(outfit))
qqnorm(resid(outfit))
qqline(resid(outfit))
data1=na.omit(resid(outfit))
acf(data1,ylab="ACF,a=0.7")