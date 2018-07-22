x=arima.sim(n=1000,list(ar=c(0.5,-0.06),ma=0.5),sd=2)+1
x
arima(x,order=c(2,0,1),method="ML")
arima(x,order=c(2,0,1),method="CSS")