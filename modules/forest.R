# Uncomment below if running this module as a standalone
source("modules/prep.R")


# I tried to do this right, but I am not sure the data is unscaled

library(randomForest)

# converting test and train to dummy variables
train = data.frame(X_train_unscaled, popularity = y_train)
test = data.frame(X_test_unscaled, popularity = y_test)


#forest_m1 <- randomForest(as.factor(popularity) ~., data = train, ntree = 2000, nodesize = 5)


#saveRDS(forest_m1, "models/ForestModelM1.RDS")

forest_m1 <- readRDS("models/ForestModelM1.RDS")


#forest_p1 <- predict(forest_m1, test, type = "prob")


#forest_p1 <- forest_p1[, 2]


#saveRDS(forest_p1, "probabilities/ForestProbs.RDS")

forest_p1 <- readRDS("probabilities/ForestProbs.RDS")

summary(forest_p1)

#forest_prob1 <- predict(forest_m1, test)
#forest_pred1 <- ifelse(forest_p1 >= 0.35, 1, 0)

#saveRDS(forest_pred1, "predictions/ForestPredictions.RDS")

forest_prob1 <- readRDS("predictions/ForestPredictions.RDS")

# cleaning the environment
rm(train, test, forest_m1, forest_p1, forest_prob1)



