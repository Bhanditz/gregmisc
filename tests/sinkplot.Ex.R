library(gregmisc)
set.seed(1234)


   set.seed(12456)
   x <- factor(sample( LETTERS[1:5], 50, replace=TRUE))
   y <- rnorm(50, mean=as.numeric(x), sd=1)


   par(mfrow=c(1,2))
   boxplot(y~x, col="darkgreen")

   sinkplot()
   anova(lm(y~x))
   sinkplot("plot",col="darkgreen")
