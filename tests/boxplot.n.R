library(gregmisc)
data(state)

# n's at bottom
boxplot.n( state.area ~ state.region)

# n's at top
boxplot.n( state.area ~ state.region, top=TRUE)

# small red text
boxplot.n( state.area ~ state.region, shrink=0.8, textcolor="red") 

