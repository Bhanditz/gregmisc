# $Id: First.R,v 1.1 2005/03/22 02:43:31 warnes Exp $

.First.lib <- function(libname, pkgname)
{
  library(gdata)
  library(gplots)
  library(gmodels)
  library(gtools)
  warning(paste("",
          "The `gregmisc' *package* has converted into a *bundle*",
          "containing four sub-packages: gdata, gtools, gmodels, and gplots.", 
          "Please load these packages directly.", sep="\n\t"), 
          call.=FALSE)
}
