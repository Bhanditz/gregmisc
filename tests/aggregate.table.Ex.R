library(gregmisc)
set.seed(1234)

# Useful example:
#
# Create a 2-way table of means, standard errors, and # obs

g1 <- sample(letters[1:5], 1000, replace=TRUE)
g2 <- sample(LETTERS[1:3], 1000, replace=TRUE )
dat <- rnorm(1000)

stderr <- function(x) sqrt( var(x,na.rm=TRUE) / nobs(x) )

means   <- aggregate.table( dat, g1, g2, mean )
stderrs <- aggregate.table( dat, g1, g2, stderr )
ns      <- aggregate.table( dat, g1, g2, nobs )
blanks <- matrix( " ", nrow=5, ncol=3)

tab <- interleave( "Mean"=round(means,2),
                   "Std Err"=round(stderrs,2),
                   "N"=ns, " " = blanks, sep=" " )

print(tab, quote=FALSE)
