library(gregmisc)

set.seed(1234567,"default")
y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
reg <- lm(y ~ x)
summary(reg)

# look at the group means
gm <- sapply(split(y,x),mean)
gm


# mean of 1st group vs mean of 4th group
fit.contrast(reg, x, c(    1,    0,    0,   -1) )
# estimate should be equal to:
gm[1] - gm[4]

# mean of 1st and 2nd groups vs mean of 3rd and 4th groups
fit.contrast(reg, x, c( -1/2, -1/2,  1/2,  1/2) )
# estimate should be equal to:
sum(-1/2*gm[1], -1/2*gm[2], 1/2*gm[3], 1/2*gm[4])

# mean of 1st group vs mean of 2nd, 3rd and 4th groups
fit.contrast(reg, x, c( -3/3,  1/3,  1/3,  1/3) ) 
# estimate should be equal to:
sum(-3/3*gm[1], 1/3*gm[2], 1/3*gm[3], 1/3*gm[4])

# all at once
cmat <- rbind( "1 vs 4"    =c(-1, 0, 0, 1),
               "1+2 vs 3+4"=c(-1/2,-1/2, 1/2, 1/2),
               "1 vs 2+3+4"=c(-3/3, 1/3, 1/3, 1/3))
fit.contrast(reg,x,cmat)

#
x2 <- rnorm(100,mean=y,sd=0.5)
reg2 <- lm(y ~ x + x2 )
fit.contrast(reg2,x,c(-1,0,0,1))
fit.contrast(reg2,x,c(-1,0,0,1), showall=T)
fit.contrast(reg2,x,c(-1,0,0,1), showall=T, conf.int=0.95)
fit.contrast(reg2,x,c(-1,0,0,1), showall=F, conf.int=0.95)

# will work in the next version of nlme
library(nlme)
data(Orthodont)
fm1 <- lme(distance ~ Sex, data = Orthodont,random=~1|Subject) 
intervals(fm1)
fit.contrast(fm1, "Sex", c(1,0) )

