library(gregmisc)
# Simple cross tabulation of education versus prior induced abortions
# using infertility data
data(infert, package = "base")
CrossTable(infert$education, infert$induced, expected = TRUE)
CrossTable(infert$education, infert$induced, expected = FALSE, correct=TRUE)
CrossTable(infert$education, infert$induced, expected = FALSE, digits=2)
