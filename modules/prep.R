set.seed(12345)
library(recipes)

# Read in data
path = file.path("Spotify.csv")
songs = read.csv(path, stringsAsFactors = T)

# Clean up and modify to fit binary classification context
songs = songs |>
  dplyr::select(-c(X, track_id, album_name, track_name, artists)) |>
  dplyr::mutate(
    popularity = ifelse(popularity > 50, 1, 0), #target variable
    key = as.factor(key),
    mode = as.factor(mode),
    time_signature = as.factor(time_signature)
    )

# Train / test split
n = nrow(songs)
p = .8

ind = sample(1:n, n*p)
train = songs[ind,]
test = songs[-ind,]

# Cook up the train/test
rec = recipe(popularity ~ ., data = train) |>
  step_impute_median(all_numeric_predictors()) |> 
  step_normalize(all_numeric_predictors()) |>
  step_dummy(all_nominal_predictors())

prep_rec = prep(rec, training = train, retain = FALSE)

X_train = bake(prep_rec, new_data = train, all_predictors())
X_test  = bake(prep_rec, new_data = test, all_predictors())
y_train = train$popularity
y_test  = test$popularity


# Cook up the train/test
rec_unscaled = recipe(popularity ~ ., data = train) |>
  step_impute_median(all_numeric_predictors()) |> 
  step_dummy(all_nominal_predictors())

prep_rec_unscaled = prep(rec_unscaled, training = train, retain = FALSE)

X_train_unscaled = bake(prep_rec_unscaled, new_data = train, all_predictors())
X_test_unscaled  = bake(prep_rec_unscaled, new_data = test, all_predictors())
y_train_unscaled = train$popularity
y_test_unscaled  = test$popularity


# Tidy environment
detach("package:recipes", unload = TRUE)
rm(path,n,p,ind,train,test,rec,prep_rec)
