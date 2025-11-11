# Uncomment below if running this module as a standalone
source("modules/prep.R")


library(neuralnet)
set.seed(12345)

train = data.frame(X_train, popularity = y_train)

neural_m1 <- neuralnet(popularity ~., data = train, lifesign = "full", threshold = .05, stepmax = 1e8, hidden = c(3, 2))

saveRDS(neural_m1, "ANNModelM1.RDS")

neural_m1 <- readRDS("ANNModelM1.RDS")
