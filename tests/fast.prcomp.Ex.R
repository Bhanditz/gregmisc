library(gregmisc)
set.seed(1234)


  # create test matrix
  set.seed(4943546)
  nr <- 50
  nc <- 2000
  x  <- matrix( rnorm( nr*nc), nrow=nr, ncol=nc )
  tx <- t(x)

  # SVD directly on matrix is SLOW:
  val.x <- svd(x)$u

  # SVD on t(matrix) is FAST:
  val.tx <- svd(tx)$v

  # and the results are equivalent:
  max( abs(val.x) - abs(val.tx) )

  # Time gap dissapears using fast.svd:
  val.x <- fast.svd(x)$u
  val.tx <- fast.svd(tx)$v
  max( abs(val.x) - abs(val.tx) )


  library(stats)

  # prcomp directly on matrix is SLOW:
  pr.x <- prcomp(x)

  # prcomp.fast is much faster
  fast.pr.x <- fast.prcomp(x)

  # and the results are equivalent
  max( pr.x$sdev - fast.pr.x$sdev )
  max( abs(pr.x$rotation[,1:49]) - abs(fast.pr.x$rotation[,1:49]) )
  max( abs(pr.x$x) - abs(fast.pr.x$x)  )

  # (except for the last and least significant component):
  max( abs(pr.x$rotation[,50]) - abs(fast.pr.x$rotation[,50]) )

