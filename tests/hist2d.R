library(gregmisc)
set.seed(12346579,"default")

# example data, bivariate normal, no correlation
x <- c(rnorm(2000, sd=4),NA,1)
y <- c(rnorm(2000, sd=1),1,NA)

# separate scales for each axis, this looks circular
print(hist2d(x,y, nbins=20, show=F))

# same scale for each axis, this looks oval
print(hist2d(x,y,  nbins=23, same.scale=TRUE, show=F))

# use different # bins in each dimension
print(hist2d(x,y,  same.scale=TRUE, nbins=c(11,21), show=F ))

# use the hist2d function to create inputs for a perspective plot
h2d <- hist2d(x,y,  show=FALSE, same.scale=TRUE, nbins=30)
h2d

