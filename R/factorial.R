# $Id: factorial.R,v 1.2 2002/09/23 13:59:30 warnes Exp $
#
# $Log: factorial.R,v $
# Revision 1.2  2002/09/23 13:59:30  warnes
# - Modified all files to include CVS Id and Log tags.
#
#

factorial <- function(x) gamma(1+x)
lfactorial <- function(x) lgamma(1+x)
