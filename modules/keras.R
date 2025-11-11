library(keras3)
library(tensorflow)
source("modules/prep.R")


X_train = as.matrix(X_train)
X_test = as.matrix(X_test)

# Class Weights
class_counts = table(y_train)
total = sum(class_counts)
num_classes = length(class_counts)

class_weights = as.list(total / (num_classes * class_counts))
names(class_weights) = names(class_counts)

# Model building function
build_model = function() {
  clear_session()
  model = keras_model_sequential(name="MagicalPredictionMachine") |>
    layer_dense(units = 20, activation = "relu", input_shape = c(ncol(X_train))) |>
    layer_dropout(0.3) |>
    layer_dense(units = 10, activation = "relu") |>
    layer_dropout(0.3) |>
    layer_dense(5, activation = "relu") |>
    layer_dense(units = 1, activation = "sigmoid")
  
  model |>
    compile(
      optimizer = "rmsprop",
      loss = "binary_crossentropy",
      metrics = c("accuracy", "AUC", "precision")
    )
  return(model)
}

# Training the model
model = build_model()
history = model |>
  fit(
    x = X_train,
    y = y_train,
    epochs = 10,
    batch_size = 30,
    validation_split = 0.2,
    class_weight = class_weights,
    verbose = 0
  )


thresh_ann = .4
# Training predictions
probs_train_ann = model |> predict(X_train, verbose = 0)
preds_train_ann = ifelse(probs_train_ann > thresh_ann, 1, 0)

# Testing predictions
probs_test_ann = model |> predict(X_test, verbose = 0)
preds_test_ann = ifelse(probs_test_ann > thresh_ann, 1, 0)


# Tidy environment
rm(class_counts)
rm(total)
rm(num_classes)
rm(class_weights)
rm(model)
rm(history)
rm(thresh_ann)
rm(build_model)
