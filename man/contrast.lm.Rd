% $Id: contrast.lm.Rd,v 1.13 2003/01/30 22:04:41 warnes Exp $
%
% $Log: contrast.lm.Rd,v $
% Revision 1.13  2003/01/30 22:04:41  warnes
%
% - fixed typo
%
% Revision 1.12  2003/01/30 21:53:09  warnes
%
% - Renamed 'contrast.lm' to 'fit.contrast'.  This new name is more
%   descriptive and makes it easier to create and use methods for other
%   classes, eg lme.
%
% - Enabled fit.contrast for lme object now that Doug Bates has provided
%   the necessary support for contrasts in the nlme package.
%
% - New contrast.lm function which generates a 'depreciated' warning and
%   calls fit.contrast
%
% - Updated help text to match changes.
%
% Revision 1.11  2003/01/03 19:02:50  warnes
%
% - Removed duplicate assigment from aov example.
%
% Revision 1.10  2002/10/29 23:00:43  warnes
%
% - Moved make.contrasts to a separate file.
% - Enhanced make contrasts to better label contrast matrix, to give
%   how.many a default value, and to coerce vectors into row matrixes.
% - Added help page for make.contrasts.
% - Added link from contrasts.lm seealso to make.contrasts.
%
% Revision 1.9  2002/10/29 19:55:15  warnes
%
% - Fix bug that prevented contrast.lm() from working on 'aov' objects
% - Add 'aov' examples to documentation for contrast.lm
% - Added note about future support for contrast.lme.
%
% Revision 1.8  2002/09/23 13:59:30  warnes
% - Modified all files to include CVS Id and Log tags.
%
% Revision 1.7  2002/08/01 19:37:14  warnes
%
% - Corrected documentation mismatch for ci, ci.default.
%
% - Replaced all occurences of '_' for assignment with '<-'.
%
% - Replaced all occurences of 'T' or 'F' for 'TRUE' and 'FALSE' with
%   the spelled out version.
%
% - Updaded version number and date.
%
% Revision 1.6  2002/04/15 21:30:39  warneg
% - Separated out, then commented out mention of contrast.lme and lme
%   objects.  The contrast.lme function will become part of Bates and
%   Pinhiero's next NLME library.
%
% Revision 1.5  2002/04/05 18:27:25  warneg
%
% - Noted that contrats.lm can be applied to lme objects.
% - Clarified return value when conf.int is specified.
%
% Revision 1.4  2001/12/10 19:39:58  warneg
% renamed contrast.factor.Rd back to contrast.lm.Rd corresponding to rename of function.
%
% Revision 1.2  2001/12/07 23:53:34  warneg
%
% Added documentation for 'conf.int' parameter.
%
% Revision 1.1  2001/12/07 19:57:59  warneg
%
% Renamed 'contrast.lm.Rd' to 'contrast.lm.Rd'.
%
% Revision 1.2  2001/09/01 00:01:55  warneg
% Release 0.3.0
%
% Revision 1.1  2001/08/31 20:55:32  warneg
%
% Updated to match changes in contrast.lm.R version 1.2.
%
% Also added more examples.
%
%

\name{contrast.lm}
\alias{contrast.lm}
\title{Compute and test arbitrary contrasts for regression objects
  (Depreciated, use 'fit.contrasts' instead.)}
\description{
 This function is depreciate and has been repleaced by
 \code{\link{fit.contrast}}.  
}
\usage{
contrast.lm(...)
}
\arguments{
  \item{\dots}{See \code{\link{fit.contrast}}.}
  }
\details{
    This function merely generates a warning message and then calls
    \code{\link{fit.contrast}}.
    }
  
\value{ See \code{\link{fit.contrast}}.  }
  
\author{ Gregory R. Warnes \email{Gregory\_R\_Warnes@groton.pfizer.com}}

\seealso{ \code{\link{fit.contrast}} }
\keyword{ models }
\keyword{ regression }

