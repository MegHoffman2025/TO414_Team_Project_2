# TO 414 Group Project

## Instructions:

Individual models are stored in `modules` directory, and rely on environment variables loaded through `prep`:

- `X_train` : training data matrix

- `X_test` : testing data matrix

- `y_train` : training labels

- `y_test` : testing labels

To load these objects into memory, you must run the command 'source("modules/prep.R")', which will load `Spotify.csv`
and perform the necessary pre-processing and splitting.

There are also additional helper functions which may be loaded with the command 'source("modules/helpers.R"). Includes
the functions:

- `easy_confusion` : enter the predictions in the variable named `preds_test_{model}` and `y_test`

- `summarize_confusions` : enter a list of confusion matrices for each model, along with names


## TODO:

Wrap conditional logic within modules to store prediction vectors into files, and 
load into memory if they exist instead of executing the model, which may take a long 
time to train.
