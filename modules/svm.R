# Uncomment below if running this module as a standalone
#source("modules/prep.R")

train = data.frame(X_train_unscaled, popularity = y_train)
test = data.frame(X_test_unscaled, popularity = y_test)

# Hyperparameters
#kern = "radial"
kern = "rbfdot"
thresh_svm = .5

#Train
#mdl = e1071::svm(x=X_train, y=y_train, kernel=kern)
library(kernlab)
#svm_m1 <- ksvm(as.factor(popularity) ~., data = train, kernel = kern, prob.model = TRUE)

#saveRDS(svm_m1, "models/SVMModelM1.RDS")

svm_m1 <- readRDS("models/SVMModelM1.RDS")

# Test data
#probs_test_svm = mdl |> predict(X_test)
#svm_p1 <- predict(svm_m1, test, type="probabilities")

#saveRDS(svm_p1, "probabilities/SVMProbs.RDS")

svm_p1 <- readRDS("probabilities/SVMProbs.RDS")

#preds_test_svm = ifelse(probs_test_svm>thresh_svm, 1, 0)
#svm_pred1 = ifelse(svm_p1>thresh_svm, 1, 0)

#saveRDS(svm_p1, "predictions/SVMPredictions.RDS")

svm_p1 <- readRDS("predictions/SVMPredictions.RDS")

# Tidy environment
#rm(kern, thresh_svm, mdl)
rm(kern, thresh_svm, svm_m1, svm_p1, svm_pred1)

