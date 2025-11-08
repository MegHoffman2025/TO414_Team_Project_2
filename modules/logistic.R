# Uncomment below if running this module as a standalone
#source("modules/prep.R")

# Add target back to data
train = X_train |> dplyr::mutate(popularity = y_train)
test = X_test |> dplyr::mutate(popularity = y_test)


# Hyperparameters
fml_string = "popularity ~ ."
thresh_lr = .5


# Train
fml = as.formula(fml_string)
mdl = glm(fml, data=train, family=binomial)

# Test
probs_test_lr = mdl |> predict(test)
preds_test_lr = ifelse(probs_test_lr>thresh_lr, 1, 0)


# Tidy environment
rm(train, test, fml_string, fml, mdl, thresh_lr)