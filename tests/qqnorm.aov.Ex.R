library(gregmisc)
set.seed(1234)

library(MASS)
data(npk)
npk.aov <- aov(yield ~ block + N*P*K, npk)
qqnorm(npk.aov)
if (dev.interactive()) qqnorm(npk.aov, omit=2:6, label=TRUE)
