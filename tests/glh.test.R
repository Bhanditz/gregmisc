library(gregmisc)
# fit a simple model
set.seed(1234567,"default")
y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
reg <- lm(y ~ x)
#summary(reg)

# test both group 1 = group 2  and group 3 = group 4
C <- rbind( c(0,-1,0,0), c(0,0,-1,1) )
ret <- glh.test(reg, C)
ret  # same as 'print(ret) '
summary(ret)
