# $Id: contrast.lm.R,v 1.7 2001/12/10 19:29:21 warneg Exp $
#
# $Log: contrast.lm.R,v $
# Revision 1.7  2001/12/10 19:29:21  warneg
# incorrectly put contrast.coeff.R (now estimable.R) here.  Now correctly put contrast.factor.R back here
#
# Revision 1.1  2001/12/07 19:53:49  warneg
# Renamed 'contrast.lm.R' to 'contrast.lm.R' to highlight that this function only works on individual factors.
#
# Revision 1.5  2001/11/13 21:19:22  warneg
# - Fixed error that occured when a factor has 2 levels and only one
#   contrast is specified
#
# Revision 1.4  2001/09/18 14:14:34  warneg
#
# Fixed bug in make.contrasts.  There was leftover code expecting a
# parameter 'x' which is no lonber provided.
#
# Revision 1.3  2001/08/31 23:36:52  warneg
#
# Added make.contrasts() to allow S-Plus so that the remaining
# unspecified df for contrats are filled by contrasts orthogonal to the
# specified ones.  This results in getting the exact same value from
# computing contrasts in a one-way anova as would be obtained by
# directly computing the means and performing the approprial linalg.
#
# Revision 1.2  2001/08/31 20:46:55  warneg
# Previous version did not actually work.  This version now correctly
# computes contrasts.  It will also (in conjunction wiht RSCompat.S)
# work in S-Plus.
#

contrast.lm _ function(reg, varname, coeff, showall=FALSE, conf.int=NULL)
{
  # make sure we have the NAME of the variable
  if(!is.character(varname))
     varname <- deparse(substitute(varname))

  # make coeff into a matrix 
  if(!is.matrix(coeff))
    {
       coeff <- matrix(coeff, nrow=1)
     }

  # make sure columns are labeled
  if (is.null(rownames(coeff)))
     {
       rn <- vector(length=nrow(coeff))
       for(i in 1:nrow(coeff))
          rn[i] <- paste(" c=(",paste(coeff[i,],collapse=" "), ")")
       rownames(coeff) <- rn
     }

  # now convert into the proper form for the contrast matrix
  cmat <- make.contrasts(coeff, ncol(coeff) )
  cn <- paste(" C",1:ncol(cmat),sep="")
  cn[1:nrow(coeff)] <- rownames(coeff)
  colnames(cmat) <- cn
  
  # call lm with the specified contrast
  m <- reg$call
  if(is.null(m$contrasts))
    m$contrasts <- list()
  m$contrasts[[varname]] <- cmat 
  if(is.R())
    r <- eval(m, parent.frame())
  else
    r <- eval(m)
	
  # now return the correct elements ....
  retval <- coef(summary(r))

  if(showall) return(retval)
  
  if( !is.R() && ncol(cmat)==1 )
    {
      retval <- retval[varname,,drop=FALSE]
      rownames(retval) <- rn
    }
  else
    {
      rn <- paste(varname,rownames(coeff),sep="")
      ind <- match(rn,rownames(retval))
      retval <- retval[ind,,drop=FALSE]
    }

  if(!is.null(conf.int)) # add confidence intervals
    {
      df <- summary(reg)$df[2]
      alpha <- 1-conf.int
      retval <- cbind( retval,
                      "lower CI"=retval[,1] - qt(1-alpha/2,df)*retval[,2],
                      "lower CI"=retval[,1] + qt(1-alpha/2,df)*retval[,2] )
    }
  
  retval
}


"make.contrasts" <-  function (contr, how.many) 
{
  value <- as.matrix(ginv(contr))  # requires library(MASS)
  if (nrow(value) != how.many) 
    stop("wrong number of contrast matrix rows")
  n1 <- if (missing(how.many)) 
    how.many - 1
  else how.many
  nc <- ncol(value)
#  rownames(value) <- levels(x)
  if (nc < n1) {
    cm <- qr(cbind(1, value))
    if (cm$rank != nc + 1) 
      stop("singular contrast matrix")
    cm <- qr.qy(cm, diag(how.many))[, 2:how.many, drop=FALSE]
    cm[, 1:nc] <- value
#    dimnames(cm) <- list(levels(x), NULL)
    if (!is.null(nmcol <- dimnames(value)[[2]])) 
      dimnames(cm)[[2]] <- c(nmcol, rep("", n1 - nc))
  }
  else cm <- value[, 1:n1, drop = FALSE]
  cm
}
