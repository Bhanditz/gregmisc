% $Id: undocumented.Rd,v 1.7 2003/05/23 18:14:12 warnes Exp $
%
% $Log: undocumented.Rd,v $
% Revision 1.7  2003/05/23 18:14:12  warnes
%
% - library() backported from 1.7-devel.  This version of the function
%   adds the "pos=" argument to specify where in the search path the
%   library should be placed.
%
% - updated .First.lib to use library(...pos=3) for MASS to avoid the
%   'genotype' data set in MASS from masking the genotype funciton in
%   genetics when it loads gregmisc
%
% - Added logit() inv.logit() matchcols() function and corresponding docs
%
% Revision 1.6  2002/10/30 02:23:10  warnes
%
% - Commented out plot.lm documentation
% - Removed make.contrasts documentation, which is now properly
%   documented in man/make.contrasts.Rd
%
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
%\alias{plot.lm}
\alias{residplot}
\title{Undocumented functions}
\description{
  These functions are undocumented.  Some are internal and not intended
  for direct use.  Others simply haven't been documented yet.  
}
\usage{
% plot.lm (x, which = 1:5, caption = c("Residuals vs Fitted", 
%     "Normal Q-Q plot", "Scale-Location plot", "Cook's distance plot"), 
%     panel = panel.smooth, sub.caption = deparse(x$call), main = "", 
%     ask = interactive() && nb.fig < length(which) && .Device != 
%         "postscript", ..., id.n = 3, labels.id = names(residuals(x)), 
%     cex.id = 0.75, band = TRUE, rug = TRUE) 
residplot(model, formula, ...) 
}
\arguments{
%   \item{x}{Undocumented}
%   \item{which}{Undocumented}
%   \item{caption}{Undocumented}
%   \item{panel}{Undocumented}
%   \item{sub.caption}{Undocumented}
%   \item{main}{Undocumented}
%   \item{ask}{Undocumented}
   \item{...}{Undocumented}
%   \item{id.n}{Undocumented}
%   \item{labels.id}{Undocumented}
%   \item{cex.id}{Undocumented}
%   \item{band}{Undocumented}
%   \item{rug}{Undocumented}
  \item{model}{Undocumented}
  \item{formula}{Undocumented}
  }
\author{Gregory R. Warnes \email{gregory\_r\_warnes@groton.pfizer.com}}
\keyword{misc}
