# Uncomment below if running this module as a standalone
#source("modules/prep.R")

# Add target back to data
#train = X_train |> dplyr::mutate(popularity = y_train)
#test = X_test |> dplyr::mutate(popularity = y_test)


# converting test and train to dummy variables
train = data.frame(X_train_unscaled, popularity = y_train)
test = data.frame(X_test_unscaled, popularity = y_test)


# Hyperparameters
fml_string = "popularity ~ ."
thresh_lr = .5

# Train
fml = as.formula(fml_string)
#mdl = glm(fml, data=train, family=binomial)

#saveRDS(mdl, "models/GLMModelM1.RDS")

glm_m1 <- readRDS("models/GLMModelM1.RDS")

# Test
#probs_test_lr = mdl |> predict(test)

#saveRDS(probs_test_lr, "probabilities/GLMProbs.RDS")

#preds_test_lr = ifelse(probs_test_lr>thresh_lr, 1, 0)

#saveRDS(preds_test_lr, "predictions/GLMPredictions.RDS")

# Tidy environment
rm(train, test, fml_string, fml, mdl, glm_m1, thresh_lr)
