library(gregmisc)
set.seed(1234567,"default")
y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
reg <- lm(y ~ x)
summary(reg)

# look at the group means
gm <- sapply(split(y,x),mean)
gm


# contrast mean of 2nd group vs mean of 4th group
estimable(reg, c(    0,   1,    0,   -1) )
# estimate should be equal to:
gm[2] - gm[4]

# confidence intervals etc. for the line for level 4
# for a separate continuous variable modelled as spline
# with a single knot at 0.5:
x2 <- rnorm(100,mean=y,sd=0.5)
reg2 <- lm(y ~ x + x2 + pmax(x2-0.5,0) )

xx2<-seq(-2,2,,50)
tmp <- estimable(reg2,cbind(1,0,0,1,xx2,pmax(xx2-0.5,0)), conf.int=0.95)
tmp


