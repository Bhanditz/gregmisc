# $Id: factorial.R,v 1.3 2003/03/07 15:48:35 warnes Exp $
#
# $Log: factorial.R,v $
# Revision 1.3  2003/03/07 15:48:35  warnes
#
# - Minor changes to code to allow the package to be provided as an
#   S-Plus chapter.
#
# Revision 1.2  2002/09/23 13:59:30  warnes
# - Modified all files to include CVS Id and Log tags.
#
#

if(is.R())
  factorial <- function(x) gamma(1+x)

lfactorial <- function(x) lgamma(1+x)
