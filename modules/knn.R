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

saveRDS(knn_m1, "mdls_temp/KNNModelM1.RDS")
