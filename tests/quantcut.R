library(gregmisc)
set.seed(123456,"default")

x <- c(rnorm(1000),NA,0)
quants <- quantcut( x )
table(quants)

quants <- quantcut( x, c(0, 1/3, 2/3), include.lowest=FALSE )
table(quants)
quants <- quantcut( x, c(0, 1/3, 2/3), include.lowest=TRUE )
table(quants)
