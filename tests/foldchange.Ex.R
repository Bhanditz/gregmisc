library(gregmisc)
set.seed(1234)


  a <- 1:21
  b <- 21:1

  f <- foldchange(a,b)

  cbind(a,b,f)

