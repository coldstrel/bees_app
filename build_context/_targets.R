# _targets.R
## load libraries, packages and source
library(quarto)
library(tarchetypes)
library(targets)
library(myProject)
library(dplyr)
library(ggplot2)
source("functions.R")


list(
  # Get the data with the function from functions.R
  tar_target(
    honey_data,
    get_data()
  ),

  ## plot colonies vs production on multiple states
  tar_target(
    colonies_vs_production_alabama,
    plot_colonies_vs_production_multi(honey_data, c("Alabama", "California"))
  ),

  # build time series for multiple states
  tar_target(
    time_series_california,
    plot_time_series_colonies_vs_production(honey_data,  c("Alabama", "California"))
  ),

  # production by year (def. 1995)
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
