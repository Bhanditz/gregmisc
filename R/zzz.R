
.First.lib <- function(libname, pkgname)
  {

    if(is.R())
      {
        require(mva) # loading MASS can fail otherwise
        if(!require(MASS))
          warning("Unable to load MASS library.",
                  "Function `contrast.lm' will fail.")
      }
#    else
#      {
#        
#      }
  }
