library(gregmisc)
set.seed(1234)

   # example data, bivariate normal, no correlation
   x <- rnorm(2000, sd=4)
   y <- rnorm(2000, sd=1)

   # separate scales for each axis, this looks circular
   hist2d(x,y)

   # same scale for each axis, this looks oval
   hist2d(x,y, same.scale=TRUE)

   # use different # bins in each dimension
   hist2d(x,y, same.scale=TRUE, nbins=c(100,200) )

   # use the hist2d function to create inputs for a perspective plot ...
   h2d <- hist2d(x,y,show=FALSE, same.scale=TRUE, nbins=c(20,30))
   persp( h2d$x, h2d$y, h2d$counts,
          ticktype="detailed", theta=30, phi=30,
          expand=0.5, shade=0.5, col="cyan", ltheta=-30)

   # for contour (line) plot ...
   contour( h2d$x, h2d$y, h2d$counts, nlevels=4 )

   # for a filled contour plot ...
   filled.contour( h2d$x, h2d$y, h2d$counts, nlevels=4,
                   col=gray((4:0)/4) )
