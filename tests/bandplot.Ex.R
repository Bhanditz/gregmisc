library(gregmisc)
set.seed(1234)


# fixed mean, changing variance
x <- 1:1000
y <- rnorm(1000, mean=1, sd=1 + x/1000 )
bandplot(x,y)

# fixed varance, changing mean
x <- 1:1000
y <- rnorm(1000, mean=x/1000, sd=1)
bandplot(x,y)

#
# changing mean and variance
#
x <- abs(rnorm(500))
y <- rnorm(500, mean=2*x, sd=2+2*x)

# the changing mean and dispersion are hard to see whith the points alone:
plot(x,y )

# regression picks up the mean trend, but not the change in variance
reg <- lm(y~x)
summary(reg)

# using bandplot on the original data helps to show the mean and
# variance trend
bandplot(x,y)

# using bandplot on the residuals helps to see that regression removes
# the mean trend but leaves the trend in variability
bandplot(predict(reg),resid(reg))

