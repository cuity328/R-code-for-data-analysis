install.packages("quantmod")
require(quantmod)

sp500index <- new.env()

getSymbols("^GSPC", env = sp500index, src = "yahoo", from = as.Date("1950-01-03"), to = as.Date("2017-12-31"))

GSPCnew <- sp500index$GSPC

GSPC85to11=GSPCnew["1985-01-02/2011-02-28"]

SPmonthly<-to.monthly(GSPC85to11$GSPC.Adjusted, name="GSPC.Adjusted")
 logrmonthly <- diff(log(Cl(SPmonthly))) 
plot(logrmonthly, main="time series plots of S&P 500 Monthly log r", major.format="%Y", ylab="Monthly log r")

Box.test(logrmonthly, lag=m, type="Ljung")

? arima.sim        
set.seed(1970)
MA1=arima.sim(n=100,list(ma=0.7),sd=1)
MA1
class(MA1)
plot.ts(MA1,type='o',ylab="a=0.7")
acf(MA1,ylab="ACF,a=0.7")
MA2=arima.sim(n=100,list(ma=c(0.7,0.1)),sd=1)
MA2
plot.ts(MA2,type='o',ylab="a=0.7")
acf(MA2,ylab="ACF,a=0.7")
AR1=arima.sim(n=100,list(ar=0.7),sd=1)
plot.ts(AR1,type='o',ylab= "b=0.7")
Xt=AR1
acf(Xt,ylab="ACF,b=0.7")
plot.ts(AR1,type='o',ylab="b=-0.7")

x1=rnorm(100,1,sqrt(1.81))
plot(x1, type ='o',pch=19, col="blue", main="normal white noise", xlab=", ylab=")
abline(1,0)

x5=arima.sim(n=100, list(ar=0.5,ma=0.279))+1
plot(x5, type='o',pch=19,col="blue",main="arma(1,1) with b=0.5 and a=0.279",xlab="",ylab="")
abline(1,0)



GSad.ag1=diff(GSad)
head(GSad.ag1)
plot(qqnorm(GSad.ag1))
qqline(GSad.ag1)