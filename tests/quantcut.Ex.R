library(gregmisc)
set.seed(1234)


  x <- rnorm(1000)
  quants <- quantcut( x )
  table(quants)
