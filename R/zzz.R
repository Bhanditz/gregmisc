
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
