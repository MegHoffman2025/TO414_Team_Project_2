# Uncomment below if running this module as a standalone
#source("modules/prep.R")


library(neuralnet)
set.seed(12345)

train = data.frame(X_train, popularity = y_train)
test = data.frame(X_test, popularity = y_test)


#neural_m1 <- neuralnet(popularity ~., data = train, lifesign = "full", threshold = .05, stepmax = 1e8, hidden = c(3, 2))

#saveRDS(neural_m1, "models/ANNModelM1.RDS")

neural_m1 <- readRDS("ANNModelM1.RDS")


#ann_p1 <- predict(neural_m1, test)
#ann_p1 <- ann_p1[, 1]

#saveRDS(ann_p1, "probabilities/ANNProbs.RDS")

ann_p1 <- readRDS("probabilities/ANNProbs.RDS")

summary(ann_p1)
ann_pred1 <- ifelse(ann_p1 >= 0.4, 1, 0)

#saveRDS(ann_pred1, "predictions/ANNPredictions.RDS")

#ann_pred1 <- readRDS("predictions/ANNPredictions.RDS")

# cleaning the environment
rm(neural_m1, ann_p1, ann_pred1)
