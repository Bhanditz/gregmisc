library(gregmisc)

set.seed(123456789,"default")
x <- rdirichlet(20, c(1,1,1))
x
if(!all.equal(apply(x,1,sum),rep(1,nrow(x)))) stop("Dirichlet generated random deviate that didn't sum to 1")
tmp.1 <- ddirichlet(x, alpha=c(1,2,3))
tmp.1
tmp.2 <- ddirichlet(x, alpha=matrix(c(1,2,3),nrow=20,ncol=3,byrow=TRUE))
if(!all.equal(tmp.1,tmp.2))
  stop("Something wrong in ddirichlet.  Equivalent computations produced different results.")
tmp.2

x <- rdirichlet(20, c(0.25,1,17))
x
if(!all.equal(apply(x,1,sum),rep(1,nrow(x)))) stop("Dirichlet generated random deviate that didn't sum to 1")
ddirichlet(x, c(0.25,1,17) )



x <- rdirichlet(20, c(0.25,1,1.7,0.15))
x
if(!all.equal(apply(x,1,sum),rep(1,nrow(x)))) stop("Dirichlet generated random deviate that didn't sum to 1")
ddirichlet(x, c(0.25,1,1.7,0.15) )

