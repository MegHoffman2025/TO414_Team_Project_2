# Uncomment below if running this module as a standalone
#source("modules/prep.R")

# Hyperparameters
k=10

# Train / Test combined
preds_test_knn = caret::knn3Train(train = X_train_mat, test = X_test_mat, cl = y_train_vec, k=k)
preds_test_knn = as.numeric(preds_test_knn)


# Tidy environment
rm(k)




library(class)

train = data.frame(X_train, popularity = y_train)

knn_m1 <- knn(train = train[,-ncol(train)], 
              test = test_scaled[,-ncol(train)], 
              cl = train_scaled[,ncol(train)], 
              k = 15, prob = T)

saveRDS(knn_m1, "models/KNNModelM1.RDS")
