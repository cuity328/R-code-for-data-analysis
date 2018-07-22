install.packages("quantmod")
require(quantmod)
##create a new enviornment
intel <- new.env()
## then download the intel

getSymbols("INTC", env = intel , src = "yahoo", from = as.Date("2017-01-01"), to = as.Date("2017-12-31"))
inteldata=intel$INTC
inteldata
dailyclose=inteldata$INTC.Close
logrdaily<- diff(log(Cl(dailyclose)))
logrdaily=na.omit(logrdaily)
install.packages("TSA")
require(TSA)
outfit=garch(x=logrdaily, order=c(1,1))
outfit
