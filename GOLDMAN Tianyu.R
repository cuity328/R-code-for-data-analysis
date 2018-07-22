install.packages("quantmod")
require(quantmod)
##create a new enviornment
goldman <- new.env()
## then download the Gs

getSymbols("GS", env = goldman , src = "yahoo", from = as.Date("2011-01-01"), to = as.Date("2011-11-23"))
GSdata=goldman$GS
GSdata
GSad=GSdata$GS.Adjusted
GSad.ag1=diff(GSad)
head(GSad.ag1)
plot(qqnorm(GSad.ag1))
qqline(GSad.ag1)






