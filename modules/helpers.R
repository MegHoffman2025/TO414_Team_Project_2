# Print and store confusion matrix for model
easy_confusion = function(preds, truth, p=T) {
  preds = as.factor(preds)
  truth = as.factor(truth)
  conf = caret::confusionMatrix(preds, reference=truth, positive="1")
  if (p) print(conf) #whether or not to print the output
  return(conf)
}

# Make table of metrics
summarize_confusions <- function(conf_list) {
  metrics <- lapply(names(conf_list), function(name) {
    cm <- conf_list[[name]]
    
    data.frame(
      Model = name,
      Accuracy = cm$overall["Accuracy"],
      Kappa = cm$overall["Kappa"],
      Sensitivity = mean(cm$byClass["Sensitivity"], na.rm = TRUE),
      Precision = mean(cm$byClass["Precision"], na.rm = TRUE)
    )
  })
  
  dt <- data.table::rbindlist(metrics)
  return(dt[])
}