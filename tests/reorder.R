library(gregmisc)

# Create a 4 level example factor
set.seed(124564,"default")
trt <- factor( sample( c("PLACEBO","300 MG", "600 MG", "1200 MG"),
                       100, replace=TRUE ) )
summary(trt)

# Change the order to something useful
trt2 <- reorder(trt, c(4,2,3,1))
summary(trt2)

# drop out the '300 MG' level
trt3 <- reorder(trt, c(4,3,1) )
summary(trt3)


