library(gregmisc)
set.seed(1234)

   # Create a 4 level example factor
   trt <- factor( sample( c("PLACEBO","300 MG", "600 MG", "1200 MG"),
                  100, replace=TRUE ) )
   summary(trt)
   # Note that the levels are not in a meaningful order.


   # Change the order to something useful
   # using indexes:
   trt2 <- reorder(trt, c(4,2,3,1))
   summary(trt2)
   # using label names:
   trt2 <- reorder(trt, c("PLACEBO","300 MG", "600 MG", "1200 MG") )
   summary(trt2)


   # drop out the '300 MG' level
   trt3 <- reorder(trt, c("PLACEBO", "600 MG", "1200 MG") )
   summary(trt3)
