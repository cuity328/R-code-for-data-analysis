install.packages("quantmod")
require(quantmod)
##create a new enviornment
intel <- new.env()
## then download the intel

getSymbols("INTC", env = intel , src = "yahoo", from = as.Date("2017-01-01"), to = as.Date("2017-12-31"))
inteldata=intel$INTC
inteldata
dailyclose=inteldata$INTC.Close
plot(dailyclose, main="time series plots of intel", major.format="%Y", ylab="close price")
logrdaily<- diff(log(Cl(dailyclose)))
plot(logrdaily, main="time series plots of intel daily log r", major.format="%Y", ylab="daily log r")
logrdaily=na.omit(logrdaily)
acf(logrdaily,ylab="ACF,a=0.7")
plot(qqnorm(logrdaily))
qqline(logrdaily)
Box.test(logrdaily, lag=1, type="Ljung")
Box.test(logrdaily, lag=6, type="Ljung")
Box.test(logrdaily, lag=12, type="Ljung")
Box.test(logrdaily, lag=24, type="Ljung")
x=arima(logrdaily, order = c(1,0,0),method="ML") 
x
install.packages("lmtest")
require(lmtest)
coeftest(x)
y=arima(logrdaily, order = c(0,0,1),method="ML")
y
coeftest(y)


   