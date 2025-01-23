library(myProject)
library(dplyr)
library(ggplot2)
library(targets)
cat("The 'targets' package has been successfully loaded.\n")


source("functions.R")
data("honey_data")

# Make sure you ran tar_make() so honey_data is available in your _targets/ cache
honey_data <- tar_read(honey_data)

# We'll also create a helper vector of all states in the dataset for convenience
all_states <- sort(unique(honey_data$state))
all_years  <- sort(unique(honey_data$year))


enableBookmarking(store = "url")

## test on github actions
## test the github actions docker
