library(gregmisc)
set.seed(1234)


x <- rnorm(100)
y <- rnorm(100, x^2 )
plot(x,y)
abline( lm(y~x), col="red", lty=1, type="b") # regression fit
lines( lowess(y~x), col="blue", lty=2, type="b") # lowess fit

smartlegend(x="center", y="top",
            c("Regression","Locally Linear Smooth"),
            col=c("red","blue"), lty=1:2)

