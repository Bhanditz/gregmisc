library(gregmisc)
set.seed(123456,"default")

running(1:20,width=5)

running(1:20,width=5)
running(1:20,width=5, allow.fewer=TRUE)

# plot running mean and central 2 standard deviation range
# estimated by last 40 observations

dat <- rnorm(500, sd=1 + (1:500)/500 )
fun <- function(x,sign=1) mean(x) + sign * sqrt(var(x))
running(dat,width=50,fun=mean,allow=TRUE)
running(dat,width=50,fun=fun, sign=-1, allow=TRUE)
running(dat,width=50,fun=fun, sign=1, allow=TRUE)

# plot running running correlation estimated by last 40 observations
# along with true (local) correlation

X <- rnorm(500, sd=1)
Y <- X + rnorm(500, sd=(1:500)/500)
rho <- 1/ ( 1 * sqrt(1 + (1:500)/500) )  # true 

running2(X,Y,width=20,fun=cor)


