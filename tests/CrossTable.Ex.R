library(gregmisc)
set.seed(1234)


# Simple cross tabulation of education versus prior induced abortions
# using infertility data
data(infert, package = "base")
CrossTable(infert$education, infert$induced, expected = TRUE)

