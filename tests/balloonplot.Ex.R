library(gregmisc)
set.seed(1234)

# Create an Example Data Frame Containing Car x Color data
carnames <- c("bmw","renault","mercedes","seat")
carcolors <- c("red","white","silver","green")
datavals <- round(rnorm(16, mean=100, sd=60),1)
data <- data.frame(Car=rep(carnames,4),
                   Color=rep(carcolors, c(4,4,4,4) ),
                   Value=datavals )
# show the data
data

# generate balloon plot with default scaling
balloonplot( data$Car, data$Color, data$Value)


# show margin label rotation & space expansion, using some long labels
levels(data$Car) <- c("BMW: High End, German","Renault: Medium End, French",
 "Mercedes: High End, German", "Seat: Imaginary, Unknown Producer")

# generate balloon plot with default scaling
balloonplot( data$Car, data$Color, data$Value, colmar=3, colsrt=90)

# Create an example using table
xnames <- sample( letters[1:3], 50, replace=2)
ynames <- sample( 1:5, 50, replace=2)

tab <- table(xnames, ynames)

balloonplot(tab)

