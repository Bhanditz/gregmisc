# This code tests for incorrect handling of glm objects, as reported
# by Ulrich Halekoh, Phd <ulrich.halekoh@agrsci.dk>

library(gregmisc)
set.seed(7882)

x<-rep(c(0,1),c(20,20))
z<-2+0.4*x
p<-plogis(z)
event<-rbinom(length(p),50,p)
y<-cbind(event,50-event)
xf<-factor(x)
g<-glm(y~xf,family=binomial)


f1<-fit.contrast(g,xf,c(-1,1))

print('fit.contrast')
print(f1)
print('summary of glm')
print(summary(g)$coef['xf1',])
print ('estimable')
print(estimable(g,c(0,1)))
print('ci')
print(ci(g))

