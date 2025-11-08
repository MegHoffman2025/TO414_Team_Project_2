# Uncomment below if running this module as a standalone
#source("modules/prep.R")


# Hyperparameters
fp_cost = 10
fn_cost = 10

# Cost Matrix
costmat = matrix(c(0, fn_cost, 
                   fp_cost, 0), nrow=2)

# Train
tree = C50::C5.0(x = X_train, y = as.factor(y_train), costs = costmat)

# Test
preds_test_tree = predict(tree, X_test)

# Tidy environment
rm(tree, costmat, fp_cost, fn_cost)
