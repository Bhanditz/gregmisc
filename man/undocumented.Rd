% $Id: undocumented.Rd,v 1.5 2002/09/23 13:59:30 warnes Exp $
%
% $Log: undocumented.Rd,v $
% Revision 1.5  2002/09/23 13:59:30  warnes
% - Modified all files to include CVS Id and Log tags.
%
% Revision 1.4  2002/04/09 00:51:33  warneg
%
% Checkin for version 0.5.3
%
% Revision 1.3  2002/03/26 21:22:35  warneg
%
% - Changed methods to include '...' to match the generic.
% - Updated for version 0.5.1
%
% Revision 1.2  2002/02/20 20:09:03  warneg
%
% Minor changes, typo and formatting fixes.
%
% Revision 1.1  2001/12/12 01:36:29  warneg
%
% Initial checkin.
%
% 

\name{undocumented}
\alias{iapply}
\alias{make.contrasts}
\alias{plot.lm}
\alias{residplot}

\title{Undocumented functions}
\description{
  These functions are undocumented.  Some are internal and not intended
  for direct use.  Others simply haven't been documented yet.  
}
\usage{
make.contrasts(contr, how.many)
plot.lm (x, which = 1:5, caption = c("Residuals vs Fitted", 
    "Normal Q-Q plot", "Scale-Location plot", "Cook's distance plot"), 
    panel = panel.smooth, sub.caption = deparse(x$call), main = "", 
    ask = interactive() && nb.fig < length(which) && .Device != 
        "postscript", ..., id.n = 3, labels.id = names(residuals(x)), 
    cex.id = 0.75, band = TRUE, rug = TRUE) 
residplot(model, formula, ...) 
}
\arguments{
  \item{contr}{Undocumented}
  \item{how.many}{Undocumented}
  \item{x}{Undocumented}
  \item{which}{Undocumented}
  \item{caption}{Undocumented}
  \item{panel}{Undocumented}
  \item{sub.caption}{Undocumented}
  \item{main}{Undocumented}
  \item{ask}{Undocumented}
  \item{...}{Undocumented}
  \item{id.n}{Undocumented}
  \item{labels.id}{Undocumented}
  \item{cex.id}{Undocumented}
  \item{band}{Undocumented}
  \item{rug}{Undocumented}
  \item{model}{Undocumented}
  \item{formula}{Undocumented}{Undocumented.}{Undocumented}
  }
\author{Gregory R. Warnes}
\keyword{misc}
