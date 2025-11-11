# Uncomment below if running this module as a standalone
source("modules/prep.R")

# Hyperparameters
k=10

# Train / Test combined
preds_test_knn = caret::knn3Train(train = X_train, test = X_test, cl = y_train, k=k)
preds_test_knn = as.numeric(preds_test_knn)


# Tidy environment
rm(k)




library(class)

train = data.frame(X_train, popularity = y_train)
test = data.frame(X_test, popularity = y_test)

knn_m1 <- knn(train = train[,-ncol(train)], 
              test = test[,-ncol(train)], 
              cl = train[,ncol(train)], 
              k = 15, prob = T)



knn_m1 <- readRDS("models/KNNModelM1.RDS")

#Pull out the actual probabilities for the KNN model

knn_p1 <- attributes(knn_m1)$prob
summary(knn_p1)

# prob is the proportion of votes to the winning class
# The predicted value is the proportion of 1s that were near the data point. If the predicted value is 1, then the probability is prob. If the predicted value is 0, then the probability is (1-prob)
knn_p1 <- ifelse(knn_m1 == 1, attributes(knn_m1)$prob, (1-attributes(knn_m1)$prob))
summary(knn_p1)


#Binning the predictions
knn_pred1 <- ifelse(knn_p1 >= 0.4, 1, 0)


