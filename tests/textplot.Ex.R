library(gregmisc)
set.seed(1234)


### simple examples
# show R version information
textplot(version)

# show the alphabet as a single string
textplot( paste(letters[1:26], collapse=" ") )

# show the alphabet as a matrix
textplot( matrix(letters[1:26], ncol=2))

### Make a nice 4 way display with two plots and two text summaries

data(iris)
par(mfrow=c(2,2))
plot( Sepal.Length ~ Species, data=iris, border="blue", col="cyan",
      main="Boxplot of Sepal Length by Species" )
plotmeans( Sepal.Length ~ Species, data=iris, barwidth=2, connect=FALSE,
           main="Means and 95\% Confidence Intervals\nof Sepal Length by Species")

info <- sapply( split(iris$Sepal.Length, iris$Species),
                function(x) round(c(Mean=mean(x), SD=sd(x), N=nobs(x)),2) )

textplot( info, valign="top"  )
title("Sepal Length by Species")

reg <- lm( Sepal.Length ~ Species, data=iris )
textplot( capture.output(summary(reg)), valign="top")
title("Regression of Sepal Length by Species")

par(mfrow=c(1,1))

