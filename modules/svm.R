# Uncomment below if running this module as a standalone
#source("modules/prep.R")

# Hyperparameters
kern = "radial"
thresh_svm = .5

#Train
mdl = e1071::svm(x=X_train, y=y_train, kernel=kern)

# Test data
probs_test_svm = mdl |> predict(X_test)
preds_test_svm = ifelse(probs_test_svm>thresh_svm, 1, 0)

# Tidy environment
rm(kern, thresh_svm, mdl)

