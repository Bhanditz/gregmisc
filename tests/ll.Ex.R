library(gregmisc)
set.seed(1234)

ll()
ll(all=TRUE)
ll("package:base")
ll("package:base")[ll("package:base")$Class!="function",]
