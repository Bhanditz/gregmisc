library(gregmisc)
set.seed(1234)

 data(mtcars)
 x  <- as.matrix(mtcars)
 rc <- rainbow(nrow(x), start=0, end=.3)
 cc <- rainbow(ncol(x), start=0, end=.3)
 hv <- heatmap.2(x, col = cm.colors(256), scale="column",
	       RowSideColors = rc, ColSideColors = cc, margin=c(5,10),
	       xlab = "specification variables", ylab= "Car Models",
	       main = "heatmap(<Mtcars data>, ..., scale = \"column\")",
               tracecol="green", density="density")

 str(hv) # the two re-ordering index vectors

 data(attitude)
 round(Ca <- cor(attitude), 2)
 symnum(Ca) # simple graphic

 # with reorder
 heatmap.2(Ca,		 symm = TRUE, margin=c(6,6), trace="none" )

 # without reorder
 heatmap.2(Ca, Rowv=FALSE, symm = TRUE, margin=c(6,6), trace="none" )

 ## For variable clustering, rather use distance based on cor():
 data(USJudgeRatings)
 symnum( cU <- cor(USJudgeRatings) )

 hU <- heatmap.2(cU, Rowv = FALSE, symm = TRUE, col = topo.colors(16),
              distfun = function(c) as.dist(1 - c), trace="none")

 ## The Correlation matrix with same reordering:
 hM <- format(round(cU[hU[[1]], hU[[2]]],2))
 hM

 # now with the correlation matrix on the plot itself

 heatmap.2(cU, Rowv = FALSE, symm = TRUE, col = rev(heat.colors(16)),
             distfun = function(c) as.dist(1 - c), trace="none",
             cellnote=hM)


