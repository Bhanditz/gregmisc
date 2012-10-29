# $Id: First.R 1492 2011-09-01 21:45:19Z warnes $

.First.lib <- function(libname, pkgname)
{
  packageStartupMessage(
          "All functionality of the `gregmisc' package has been moved",
          "into the four 'g' packages: gdata, gtools, gmodels, and gplots. ",
          "This package is retained to make it easy to install and load",
          "the full set. Please consider loading these packages directly."
                        )
}
