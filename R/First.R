# $Id: First.R 1030 2006-11-29 00:20:20Z warnes $

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
