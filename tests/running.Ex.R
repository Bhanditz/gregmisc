library(gregmisc)
set.seed(123456,"default")

# show effect of pad
running(1:20,width=5)
running(1:20,width=5,pad=TRUE)

# show effect of align
running(1:20,width=5, align="left", pad=TRUE)
running(1:20,width=5, align="center", pad=TRUE)
running(1:20,width=5, align="right", pad=TRUE)

# Use 'pad' to ensure correct length of vector, also show the effect
# of allow.fewer.
par(mfrow=c(2,1))
plot(1:20, running(1:20,width=5, allow.fewer=FALSE, pad=TRUE), type="b")
plot(1:20, running(1:20,width=5, allow.fewer=TRUE,  pad=TRUE), type="b")
par(mfrow=c(1,1))

# plot running mean and central 2 standard deviation range
# estimated by *last* 40 observations
dat <- rnorm(500, sd=1 + (1:500)/500 )
plot(dat)
sdfun <- function(x,sign=1) mean(x) + sign * sqrt(var(x))
lines(running(dat, width=51, pad=TRUE, fun=mean), col="blue")
lines(running(dat, width=51, pad=TRUE, fun=sdfun, sign=-1), col="red")
lines(running(dat, width=51, pad=TRUE, fun=sdfun, sign= 1), col="red")


# plot running correlation estimated by last 40 observations (red)
# against the true local correlation (blue)
sd.Y <- seq(0,1,length=500)

X <- rnorm(500, sd=1)
Y <- rnorm(500, sd=sd.Y)

plot(running(X,X+Y,width=20,fun=cor,pad=TRUE),col="red",type="s")

r <- 1 / sqrt(1 + sd.Y^2) # true cor of (X,X+Y)
lines(r,type="l",col="blue")
