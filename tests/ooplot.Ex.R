library(gregmisc)
set.seed(1234)

     data(VADeaths, package = "base")

     VADeaths <- cbind( Age=c(50,55,60,65,70), VADeaths)

     mp <- ooplot(VADeaths) # default
     mp <- ooplot(VADeaths, type="xyplot")  # same as default
     mp <- ooplot(VADeaths, type="linear")  # linear scale
     mp <- ooplot(VADeaths, type="barplot") # barplot
     mp <- ooplot(VADeaths, type="stackbar") # stacked

     tot <- colMeans(VADeaths[,-1])
     ooplot(VADeaths, 
             col = c("lightblue", "mistyrose", "lightcyan", "lavender"),
             legend = colnames(VADeaths)[-1], ylim = c(0, 100),
             type="barplot", cex.values=0.75)
     title(main = "Death Rates in Virginia", font.main = 4)

