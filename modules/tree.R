# Uncomment below if running this module as a standalone
#source("modules/prep.R")


# Hyperparameters
#fp_cost = 10
#fn_cost = 10

# Cost Matrix
#costmat = matrix(c(0, fn_cost, fp_cost, 0), nrow=2)

# converting test and train to dummy variables
train = data.frame(X_train_unscaled, popularity = y_train)
test = data.frame(X_test_unscaled, popularity = y_test)

# Train
#tree = C50::C5.0(x = X_train, y = as.factor(y_train), costs = costmat)
library(C50)
#decision_m1 <- C5.0(as.factor(popularity) ~., data = train)

#saveRDS(decision_m1, "models/DecisionModelM1.RDS")

decision_m1 <- readRDS("models/DecisionModelM1.RDS")

# Test
#preds_test_tree = predict(tree, X_test)
#decision_p1 <- predict(decision_m1, test, type = "prob")
# taking only the probability of a person having high alcohol consumption

#decision_p1 <- decision_p1[, 2]

#saveRDS(decision_p1, "probabilities/DecisionProbs.RDS")

decision_p1 <- readRDS("probabilities/DecisionProbs.RDS")

#decision_pred1 <- ifelse(decision_p1 >= .5, 1, 0)

#saveRDS(decision_pred1, "predictions/DecisionPredictions.RDS")

decision_pred1 <- readRDS("predictions/DecisionPredictions.RDS")

# Tidy environment
#rm(tree, costmat, fp_cost, fn_cost)
rm(decision_m1, train, test, decision_p1, decision_pred1)
