library(gregmisc)
set.seed(123456,"default")

x <- rep(1:5, 10)
y <- round(rnorm(length(x),x))

# standard x-y plot with overlapping points
space(x,y)

# check that missign values correctly handled
x <- c(x,NA)
y <- c(y,NA)
space(x,y)


