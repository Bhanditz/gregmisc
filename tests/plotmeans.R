library(gregmisc)
# show comparison with boxplot
data(state)
plotmeans(state.area ~ state.region)   

# show some color and mean labels
plotmeans(state.area ~ state.region,
          mean.labels=TRUE, digits=-3,
          col="red", connect=FALSE)

# show how to specify which means should be connected
plotmeans(state.area ~ state.region, connect=list(1:2, 3:4),
          ccol="red", pch=7 )

# show how to specify which means should be connected
plotmeans(state.area ~ state.region, connect=list(1:2, 3:4),
          ccol="red", pch=7, mean.labels=TRUE )
