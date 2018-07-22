
# Generate a binomial tree
# current_price = S
# period = n
# risk-free interest rate = r
# strike_price = X
# time_period = t
# volatility = sigma

S <- readline(prompt="Enter current_price: ")
S <- as.numeric(S)
t <- readline(prompt="Enter time_period/year: ")
t <- as.numeric(t)
n <- readline(prompt="Enter period: ")
n <- as.numeric(n)
X <- readline(prompt="Enter strike_price: ")
X <- as.numeric(X)
sigma <- readline(prompt="Enter volatility: ")
sigma <-as.numeric(sigma)
r <- readline(prompt="Enter risk-free interest rate: ")
r <- as.numeric(r)


Optionprice <- function(S,X,r,t,sigma,n)
{

  h <- t/n
  u <- exp(sigma*sqrt(h))
  d <- 1/u
  pstar <- (exp(r*h)-d)/(u-d) 
  m <- matrix (0, nrow = n+1, ncol=n+1)
  
  for(i in 0:n)
    m[n+1, i+1] <- max(S*u^(n-i)*d^i-X,0)
  for(j in n:1)
  { 
    for(k in 0:j-1)
      m[j,k+1] <- (pstar*m[j+1,k+1]+(1-pstar)*m[j+1,k+2])*exp(-r*h)
    
  }
  return(m)
}
