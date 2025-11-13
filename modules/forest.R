# Uncomment below if running this module as a standalone
source("modules/prep.R")


# I tried to do this right, but I am not sure the data is unscaled

library(randomForest)

train = data.frame(X_train, popularity = y_train)
test = data.frame(X_test, popularity = y_test)


forest_m1 <- randomForest(as.factor(popularity) ~., data = train, ntree = 2000, nodesize = 5)


saveRDS(forest_m1, "ForestModelM1.RDS")

forest_m1 <- readRDS("models/ForestModelM1.RDS")


forest_p1 <- predict(forest_m1, test_unscaled)

summary(forest_p1)




