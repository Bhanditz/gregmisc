library(gregmisc)
set.seed(1234)

data(infert)
elem(infert)
model <- glm(case~spontaneous+induced, family=binomial, data=infert)
elem(model, dim=TRUE)
elem(model$family)
