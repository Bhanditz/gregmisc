# $Id: contrast.lm.R,v 1.12 2002/09/24 15:55:16 warnes Exp $
#
# $Log: contrast.lm.R,v $
# Revision 1.12  2002/09/24 15:55:16  warnes
#
# - Add ability to show confidence intervals when showall=TRUE.
#
# Revision 1.11  2002/08/01 19:37:14  warnes
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
# Revision 1.10  2002/04/15 21:28:51  warneg
# - Separated out, then commented out contrast.lme code.  The
#   contrast.lme function will become part of Bates and Pinhiero's NLME
#   library.
#
# Revision 1.9  2002/04/09 00:51:29  warneg
#
# Checkin for version 0.5.3
#
# Revision 1.8  2002/04/05 18:23:17  warneg
#
# - Updated contrast.lm to handle lme objects
# - Modified contrast.lm to compute confidence intervals even when
#   showall is true.
# - Added check and warning if conf.int is outside (0,1).  This will ensuere
#   that conf.int=TRUE does not cause nonsense results.
#
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

contrast.lm <- function(reg, varname, coeff, showall=FALSE, conf.int=NULL)
{
  # check class of reg
  if( !("lm" %in% class(reg)) )
    stop("contrast.lm can only be applied to of or inheriting from 'lm'.")
  
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
  sreg <- summary(r)
  retval <- cbind(coef(sreg), "DF"=sreg$df[2])

  if( !showall )
    {
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

    }

  if(!is.null(conf.int)) # add confidence intervals
    {
      alpha <- 1-conf.int
      retval <- cbind( retval,
                      "lower CI"=retval[,1] -
                      qt(1-alpha/2,retval[,5])*retval[,2],
                      "lower CI"=retval[,1] +
                      qt(1-alpha/2,retval[,5])*retval[,2] )
    }

  return(retval[,-5])
}



#contrast.lme <- function(reg, varname, coeff, showall=FALSE, conf.int=NULL)
#{
#  # check class of reg
#  if( !("lm" %in% class(reg)) && !("lme" %in% class(reg)) )
#    stop("contrast.lme can only be applied to 'lme' objects")
  
#  # make sure we have the NAME of the variable
#  if(!is.character(varname))
#     varname <- deparse(substitute(varname))

#  # make coeff into a matrix 
#  if(!is.matrix(coeff))
#    {
#       coeff <- matrix(coeff, nrow=1)
#     }

#  # make sure columns are labeled
#  if (is.null(rownames(coeff)))
#     {
#       rn <- vector(length=nrow(coeff))
#       for(i in 1:nrow(coeff))
#          rn[i] <- paste(" c=(",paste(coeff[i,],collapse=" "), ")")
#       rownames(coeff) <- rn
#     }

#  # now convert into the proper form for the contrast matrix
#  cmat <- make.contrasts(coeff, ncol(coeff) )
#  cn <- paste(" C",1:ncol(cmat),sep="")
#  cn[1:nrow(coeff)] <- rownames(coeff)
#  colnames(cmat) <- cn

#  # call lm with the specified contrast
#  m <- reg$call
#  if(is.null(m$contrasts))
#    m$contrasts <- list()
#  m$contrasts[[varname]] <- cmat 
#  if(is.R())
#    r <- eval(m, parent.frame())
#  else
#    r <- eval(m)

#  # now return the correct elements ....
#  est <- r$coefficients$fixed
#  se  <- sqrt(diag(r$varFix))
#  tval <- est/se
#  df   <- r$fixDF$X
#  retval <- cbind(
#                  "Estimate"= est,
#                  "Std. Error"= se,
#                  "t-value"= tval,
#                  "Pr(>|t|)"=  2 * (1 - pt(abs(tval), df)),
#                  "DF"=df
#                  )

#  if( !showall )
#    {
#      if( !is.R() && ncol(cmat)==1 )
#        {
#          retval <- retval[varname,,drop=FALSE]
#          rownames(retval) <- rn
#        }
#      else
#        {
#          rn <- paste(varname,rownames(coeff),sep="")
#          ind <- match(rn,rownames(retval))
#          retval <- retval[ind,,drop=FALSE]
#        }

#      if(!is.null(conf.int)) # add confidence intervals
#        {
#          alpha <- 1-conf.int
#          retval <- cbind( retval,
#                          "lower CI"=retval[,1] -
#                          qt(1-alpha/2,retval[,5])*retval[,2],
#                          "lower CI"=retval[,1] +
#                          qt(1-alpha/2,retval[,5])*retval[,2] )
#        }
#    }
  
#  return(retval[,-5])
#}


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
