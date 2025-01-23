## function to get the data contained on myProject (package)
get_data <- function(){
  myProject::honey_data
}

## Colonies vs Production for MULTIPLE states
plot_colonies_vs_production_multi <- function(data, selected_states) {
  # Filter the data to only those states
  df <- data %>%
    filter(state %in% selected_states)

  ## Create a geom plot
  ggplot(df, aes(x = colonies_number, y = production, color = state)) +
    geom_point(size = 3, alpha = 0.7) +
    geom_smooth(method = "lm") +
    facet_wrap(~ state, scales = "free") +  # one panel per state
    theme_minimal() +
    labs(
      title = paste("Colonies vs. Production:", paste(selected_states, collapse = ", ")),
      x = "Colonies Number",
      y = "Production"
    )
}

# Time series: Colonies vs Production
plot_time_series_colonies_vs_production <- function(data, selected_states) {
  # Filter to chosen states
  df <- data %>%
    filter(state %in% selected_states)

  # Plot time series for production with faceting
  ggplot(df, aes(x = year, y = production, color = state, group = state)) +
    geom_line(size = 1.1) +
    geom_point(size = 2) +
    facet_wrap(~ state, scales = "free_y") +  # Each state gets its own y-axis
    theme_minimal() +
    labs(
      title = paste("Production for", paste(selected_states, collapse = ", ")),
      x = "Year",
      y = "Production",
      color = "State"
    ) +
    scale_color_manual(values = rep("steelblue", length(selected_states))) +
    theme(strip.text = element_text(size = 12, face = "bold"))
}


# Production by a chosen year
plot_production_by_year <- function(data, selected_year) {
  # filter over chosen year
  df <- data %>%
    filter(year == selected_year)
  # plot in ascending order
  ggplot(df, aes(x = reorder(state, -production), y = production)) +
    geom_col(fill = "steelblue") +
    coord_flip() +
    theme_minimal() +
    labs(
      title = paste("Honey Production in", selected_year),
      x = "State",
      y = "Production"
    )
}
#
#








