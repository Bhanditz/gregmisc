\name{factorial}
\alias{factorial}
\alias{lfactorial}
\title{Compute factorial function}
\description{
  Compute x!, the factorial of x, or log(x!) the natural log of the
  factorial of x.
}
\usage{
factorial(x)
lfactorial(x)
}
\arguments{
  \item{x}{ numeric vector }
}
\details{
  The function \code{factorial} and \code{lfactorial} return the
  factorial function and the natural logarithm of the factorial
  function:

  x! = factorial(x) =  1 * 2 * .. * x = Gamma(1 + x)

}
%\value{
%  ~Describe the value returned
%  If it is a LIST, use
%  \item{comp1 }{Description of `comp1'}
%  \item{comp2 }{Description of `comp2'}
%  ...
%}
%\references{ ~put references to the literature/web site here ~ }
%\author{ ~~who you are~~ }
\seealso{ \code{\link{gamma}}, \code{\link{lgamma}} }

\examples{
   factorial(4)
   lfactorial(40)
}

\keyword{math}

