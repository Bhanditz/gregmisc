# $Id: zzz.R,v 1.3 2002/09/23 13:59:30 warnes Exp $
#
# $Log: zzz.R,v $
# Revision 1.3  2002/09/23 13:59:30  warnes
# - Modified all files to include CVS Id and Log tags.
#
#

.First.lib <- function(libname, pkgname)
  {

    if(is.R())
      {
        if(!require(MASS))
          warning("Unable to load MASS library.  Function `contrast.lm' will fail.")
      }
#    else
#      {
#        
#      }
  }
