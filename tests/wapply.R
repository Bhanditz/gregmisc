library(gregmisc)
#show local mean and inner 2-sd interval to help diagnose changing mean
#or variance structure

set.seed(12345,"default")
x <- 1:1000
y <- rnorm(1000, mean=1, sd=1 + x/1000 )
y
wapply(x,y,mean)

CL <- function(x,sd) mean(x)+sd*sqrt(var(x))

wapply(x,y,CL,sd= 1)
wapply(x,y,CL,sd=-1)
wapply(x,y,CL,sd= 2)
wapply(x,y,CL,sd=-2)

x <- 1:1000
y <- rnorm(1000, mean=x/1000, sd=1)
wapply(x,y,mean)

CL <- function(x,sd) mean(x)+sd*sqrt(var(x))

wapply(x,y,CL,sd= 1,method="fraction",width=1/20)
wapply(x,y,CL,sd=-1,method="fraction",width=1/20)
wapply(x,y,CL,sd= 2,method="nobs",width=250)
wapply(x,y,CL,sd=-2,method="nobs",width=250)
wapply(x,y,CL,sd=-2,method="width",width=10)


wapply(x,y,CL,sd= 1,method="fraction",width=1/20, n=20)
wapply(x,y,CL,sd=-1,method="fraction",width=1/20, n=40)
wapply(x,y,CL,sd= 2,method="nobs",width=250, n=60)
wapply(x,y,CL,sd=-2,method="nobs",width=250, n=80)
wapply(x,y,CL,sd=-2,method="width",width=10, n=100)

