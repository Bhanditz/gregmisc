library(gregmisc)
set.seed(1234)


# capture the results of a loop
loop.text <- capture( for(i in 1:10) cat("i=",i,"\n") )
loop.text

# put regression summary results into a string
data(iris)
reg <- lm( Sepal.Length ~ Species, data=iris )
summary.text <- sprint( summary(reg) )
cat(summary.text)
