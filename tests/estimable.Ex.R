library(gregmisc)
set.seed(1234)

# simple contrast and confidence interval
y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
reg <- lm(y ~ x)
estimable(reg, c(    0,   1,    0,   -1) )

# Fit a spline with a single knot at 0.5 and plot the *pointwise*
# confidence intervals
x2 <- rnorm(100,mean=y,sd=0.5)
reg2 <- lm(y ~ x + x2 + pmax(x2-0.5,0) )
range <- seq(-2,2,,50)
tmp <- estimable(reg2,cbind(1,0,0,1,range,pmax(range-0.5,0)), conf.int=0.95)
plotCI(x=range,y=tmp[,1],li=tmp[,6],ui=tmp[,7])

# Fit both linear and quasi-Poisson models to iris data, then compute
# conficence intervals on a contrast.
data(iris)
lm1  <- lm(Sepal.Length~Sepal.Width+Species+Sepal.Width:Species, data=iris)
glm1 <- glm(Sepal.Length~Sepal.Width+Species+Sepal.Width:Species, data=iris,
            family=quasipoisson("identity"))
cm <- rbind( lambda1 = c(1,0,1,0,0,0),
             lambda2 = c(1,0,0,1,0,0))
estimable(lm1,cm)
estimable(glm1,cm)
