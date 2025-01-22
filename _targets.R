# _targets.R
library(quarto)
library(tarchetypes)
library(targets)
library(myProject)
library(dplyr)
library(ggplot2)
source("functions.R")


list(
  # 1) A target that gets your data
  tar_target(
    honey_data,
    get_data()  # your custom function or data read
  ),

  # 2) Build a plot for a specific state, e.g., "Alabama"
  tar_target(
    colonies_vs_production_alabama,
    plot_colonies_vs_production_multi(honey_data, c("Alabama", "California"))
  ),

  # 3) Build time series for e.g., "California"
  tar_target(
    time_series_california,
    plot_time_series_colonies_vs_production(honey_data,  c("Alabama", "California"))
  ),

  # 4) Production by year for e.g., 1995
  tar_target(
    production_1995,
    plot_production_by_year(honey_data, 1995)
  ),

  ## Create a quarto document with the functions
  tar_quarto(
    name = my_doc,
    path = "my_doc.qmd"
  )

)
