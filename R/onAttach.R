# $Id: onAttach.R 1686 2013-06-28 21:37:23Z warnes $

.onAttach <- function(libname, pkgname)
{
  packageStartupMessage(
          "All functionality of the `gregmisc' package has been moved",
          "into the four 'g' packages: gdata, gtools, gmodels, and gplots. ",
          "This package is retained to make it easy to install and load",
          "the full set. Please consider loading these packages directly."
                        )
}
