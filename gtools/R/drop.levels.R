# $Id: drop.levels.R,v 1.1 2005/02/15 00:40:53 warnes Exp $


drop.levels <- function (x)  {
  as.data.frame(lapply(x,
                       function(xi) {
                         if (is.factor(xi))
                           xi <- factor(xi)
                         xi
                       }))
}
