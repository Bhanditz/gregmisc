# $Id: contrast.lm.Rd,v 1.7 2002/08/01 19:37:14 warnes Exp $
#
# $Log: contrast.lm.Rd,v $
# Revision 1.7  2002/08/01 19:37:14  warnes
#
# - Corrected documentation mismatch for ci, ci.default.
#
# - Replaced all occurences of '_' for assignment with '<-'.
#
# - Replaced all occurences of 'T' or 'F' for 'TRUE' and 'FALSE' with
#   the spelled out version.
#
# - Updaded version number and date.
#
# Revision 1.6  2002/04/15 21:30:39  warneg
# - Separated out, then commented out mention of contrast.lme and lme
#   objects.  The contrast.lme function will become part of Bates and
#   Pinhiero's next NLME library.
#
# Revision 1.5  2002/04/05 18:27:25  warneg
#
# - Noted that contrats.lm can be applied to lme objects.
# - Clarified return value when conf.int is specified.
#
# Revision 1.4  2001/12/10 19:39:58  warneg
# renamed contrast.factor.Rd back to contrast.lm.Rd corresponding to rename of function.
#
# Revision 1.2  2001/12/07 23:53:34  warneg
#
# Added documentation for 'conf.int' parameter.
#
# Revision 1.1  2001/12/07 19:57:59  warneg
#
# Renamed 'contrast.lm.Rd' to 'contrast.lm.Rd'.
#
# Revision 1.2  2001/09/01 00:01:55  warneg
# Release 0.3.0
#
# Revision 1.1  2001/08/31 20:55:32  warneg
#
# Updated to match changes in contrast.lm.R version 1.2.
#
# Also added more examples.
#
#

\name{contrast.lm}
\alias{contrast.lm}
%\alias{contrast.lme}
\title{Compute (and test) arbitrary contrasts for regression objects}
\description{
 Compute (and test) arbitrary contrasts for regression objects.
}
\usage{
contrast.lm(reg, varname, coeff, showall=FALSE, conf.int=NULL)
%contrast.lme(reg, varname, coeff, showall=FALSE, conf.int=NULL)
}
\arguments{
  \item{reg}{Regression (lm,glm,aov) %,lme)
    object for which the contrast(s) will be computed.}
  \item{varname}{variable name}
  \item{coeff}{vector or matrix specifying contrasts (one per row).}
  \item{showall}{return all regression coefficients. If \code{TRUE}, all
    model cofficients will be returned.  If \code{FALSE} (the defaults),
    only the coefficients corresponding to the specified contrast will
    be returned.}
  \item{conf.int}{numeric value on (0,1) or NULL.  If a numeric value is
    specified, confidence intervals with nominal coverage probability
    \code{conf.int} will be computed.  If \code{NULL}, confidence
    intervals will not be computed.}
  }
  
\details{
  Computes the specified contrast(s) by re-fitting the model with the
  appropriate arguments.  A contrast of the form \code{c(1,0,0,-1)}
  would compare the mean of the first group with the mean of the fourth group.
}
\value{
  Returns a matrix containing estimated coefficients, standard errors, t
  values, two-sided p-values. If conf.int is specified lower and upper
  confidence limits are also returned.
}
\references{Venables & Ripley, Section 6.2}
\author{ Gregory R. Warnes \email{Gregory\_R\_Warnes\@groton.pfizer.com}}

\seealso{ \code{\link{lm}}, \code{\link{contrasts}},
  \code{\link{contr.treatment}},  \code{\link{contr.poly}}  }

\examples{
y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
reg <- lm(y ~ x)
summary(reg)

# look at the group means
gm <- sapply(split(y,x),mean)
gm


# mean of 1st group vs mean of 4th group
contrast.lm(reg, x, c(    1,    0,    0,   -1) )
# estimate should be equal to:
gm[1] - gm[4]

# mean of 1st and 2nd groups vs mean of 3rd and 4th groups
contrast.lm(reg, x, c( -1/2, -1/2,  1/2,  1/2) )
# estimate should be equal to:
sum(-1/2*gm[1], -1/2*gm[2], 1/2*gm[3], 1/2*gm[4])

# mean of 1st group vs mean of 2nd, 3rd and 4th groups
contrast.lm(reg, x, c( -3/3,  1/3,  1/3,  1/3) ) 
# estimate should be equal to:
sum(-3/3*gm[1], 1/3*gm[2], 1/3*gm[3], 1/3*gm[4])

# all at once
cmat <- rbind( "1 vs 4"    =c(-1, 0, 0, 1),
               "1+2 vs 3+4"=c(-1/2,-1/2, 1/2, 1/2),
               "1 vs 2+3+4"=c(-3/3, 1/3, 1/3, 1/3))
contrast.lm(reg,x,cmat)

#
x2 <- rnorm(100,mean=y,sd=0.5)
reg2 <- lm(y ~ x + x2 )
contrast.lm(reg2,x,c(-1,0,0,1))

% \dontrun{
% # will work in the next version of nlme
% library(nlme)
% data(Orthodont)
% fm1 <- lme(distance ~ Sex, data = Orthodont,random=~1|Subject) 
% intervals(fm1)
% contrast.lme(fm1, "Sex", c(1,0) )
% }
}
\keyword{ models }
\keyword{ regression }

