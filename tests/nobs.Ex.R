library(gregmisc)
set.seed(1234)


x <- c(1,2,3,5,NA,6,7,1,NA )
length(x)
nobs(x)

df <- data.frame(x=rnorm(100), y=rnorm(100))
df[1,1] <- NA
df[1,2] <- NA
df[2,1] <- NA

nobs(df)
