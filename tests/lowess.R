library(gregmisc)
data(cars)

# default method
lowess(cars)
lowess(cars, f=.2)

# formula method
lowess(dist ~ speed, data=cars)
lowess(dist ~ speed, data=cars, f=.2)
lowess(dist ~ speed, data=cars, f=.4, delta=.1)

