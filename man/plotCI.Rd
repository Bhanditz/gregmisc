\name{plotCI}
\alias{plotCI}
\title{Plot Error Bars}
\description{Plot error bars.}
\usage{
plotCI(x, y=NULL, uiw, liw=uiw, ..., col, ylim,
       barcol=col, sfrac=0.01, gap=1.5, labels=F,
       barwidth=1)
}
\arguments{
  \item{x,y}{ coordonates for the center of error bars. \code{y}
    defaults to 1:n }
  
  \item{uiw}{ width of the upper error bar. Set to \code{FALSE} or
    \code{0} to omit upper bars.}
  
  \item{liw}{ width of the lower error bar.  Defaults to same value as
    \code{uiw}.  Set to \code{FALSE} or \code{0} to omit lower bars. }
  
  \item{\dots}{ optional plotting parameters }
	    
  \item{col}{ color of center marker of error bars. Default is black.}
  
  \item{ylim}{ range of y values to include in the plotting area. }
  
  \item{barcol}{color of the error bars.  Defaults to the same value as
    \code{col} }
  
  \item{sfrac}{ width of "crossbar" at the end of error bar as a fraction
    of the x plotting region times \code{barwidth}. Defaults to 0.01. }
  
  \item{gap}{ space left between the center of the error bar and the
    lines marking the error bar in units of the height of the letter
    "O".   Defaults to 1.0 }

  \item{labels}{ either a logical value indicating whether the circles
    representing the x values should be replaced with text giving the
    actual values or a vector containing labels to use
    instead. Defaults to \code{FALSE}. }

  \item{barwidth}{ line width of the error bars. Defaults to 1. }

  \item{add}{logical indicating whether error bars should be added to
    the current plot.  If \code{FALSE} (the defailt), a new plot will be
    created and symbols/labels for the x values will be plotted before
    drawing error bars.}
}
%\details{
%  ~~ If necessary, more details than the __description__  above ~~
%}

\author{ Original version by Bill Venables
  \email{wvenable@attunga.stats.adelaide.edu.au} posted to r-help on
  Sep. 20, 1997.  Enhanced version posted to r-help by Ben Bolker
  \email{ben@zoo.ufl.edu} on Apr. 16, 2001.  This version was modified
  and extended by Gregory R. Warnes
  \email{Gregory\_R\_Warnes@groton.pfizer.com}.
  }

\seealso{ \code{\link{plotmeans}} provides an enhanced wrapper to
          \code{plotCI}. }

\examples{

  # plot means and 
  data(state)
  tmp   <- split(state.area, state.region)
  means <- sapply(tmp, mean)
  stdev <- sqrt(sapply(tmp, var))
  n     <- sapply(tmp,length)
  ciw   <- qt(0.975, n) * stdev / sqrt(n)

  # plain
  plotCI(x=means, uiw=ciw)     

  # prettier 
  plotCI(x=means, uiw=ciw, col="black", barcol="blue", lwd=1)

  # give mean values
  plotCI(x=means, uiw=ciw, col="black", barcol="blue",
         labels=round(means,-3), xaxt="n", xlim=c(0,5) )
  axis(side=1, at=1:4, labels=names(tmp), cex=0.7)

  # better yet, just use plotmeans ... #
  plotmeans( state.area ~ state.region )

}

\keyword{ hplot }
