# $Id$
#
# $Log$
#

# Reorder the levels of a factor.

reorder <- function( X, order )
  {
    if(!is.factor(X)) stop("reorder only handles factor variables")
    factor( X, levels=levels(X)[order] )
  }
