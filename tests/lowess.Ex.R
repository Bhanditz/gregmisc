library(gregmisc)
set.seed(1234)

data(cars)

# default method
plot(cars, main = "lowess(cars)")
lines(lowess(cars), col = 2)
lines(lowess(cars, f=.2), col = 3)
legend(5, 120, c(paste("f = ", c("2/3", ".2"))), lty = 1, col = 2:3)

# formula method
plot(dist ~ speed, data=cars, main = "lowess(cars)")
lines(lowess(dist ~ speed, data=cars), col = 2)
lines(lowess(dist ~ speed, data=cars, f=.2), col = 3)
legend(5, 120, c(paste("f = ", c("2/3", ".2"))), lty = 1, col = 2:3)

