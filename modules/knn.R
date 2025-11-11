# Uncomment below if running this module as a standalone
#source("modules/prep.R")

# Hyperparameters
k=10

# Train / Test combined
preds_test_knn = caret::knn3Train(train = X_train, test = X_test, cl = y_train, k=k)
preds_test_knn = as.numeric(preds_test_knn)


# Tidy environment
rm(k)

