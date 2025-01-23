server <- function(session, input, output) {
  output$mainPlot <- renderPlot({

    # Decide which plot function to call based on user selection
    if (input$plotType == "Colonies vs Production") {

      # Handle the user-chosen states (multiple)
      req(input$states_colonies)  # ensure not NULL
      plot_colonies_vs_production_multi(honey_data, input$states_colonies)

    } else if (input$plotType == "Time Series Colonies vs Production") {

      # Handle the user-chosen states (multiple)
      req(input$states_time)  # ensure not NULL
      states_to_plot <- input$states_time
      plot_time_series_colonies_vs_production(honey_data, states_to_plot)

    } else if (input$plotType == "Production by Year") {

      # Single year
      req(input$yearInput)
      plot_production_by_year(honey_data, as.numeric(input$yearInput))

    }
  })
}
