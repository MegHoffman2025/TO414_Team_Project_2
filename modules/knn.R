# Uncomment below if running this module as a standalone
#source("modules/prep.R")

# Hyperparameters
k=10

# Train / Test combined
preds_test_knn = caret::knn3Train(train = X_train_mat, test = X_test_mat, cl = y_train_vec, k=k)
preds_test_knn = as.numeric(preds_test_knn)


# Tidy environment
rm(k)

