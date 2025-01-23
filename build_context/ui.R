ui <- fluidPage(
  titlePanel("Dynamic Honey Data Visualization"),

  sidebarLayout(
    sidebarPanel(
      ## Select a plot from a drop down menu
      selectInput(
        "plotType", "Choose a Plot:",
        choices = c(
          "Colonies vs Production",
          "Time Series Colonies vs Production",
          "Production by Year"
        )
      ),

      ## Clonies vs production plot, multiple states can be chosen
      conditionalPanel(
        condition = "input.plotType == 'Colonies vs Production'",
        helpText("Select one or more states:"),
        shinyWidgets::pickerInput(
          inputId = "states_colonies",
          label = "States:",
          choices = all_states,
          multiple = TRUE,
          selected = c("Alabama", "California"), # default states
          options = list(
            plugins = list("remove_button"),
            create = TRUE,
            persist = FALSE
          )
        )
      ),

      # Time series plot for multiple states
      conditionalPanel(
        condition = "input.plotType == 'Time Series Colonies vs Production'",
        helpText("Select one or more states:"),
        shinyWidgets::pickerInput(
          inputId = "states_time",
          label = "States:",
          choices = all_states,
          multiple = TRUE,
          selected = c("Alabama", "California"), # Default states
          options = list(
            plugins = list("remove_button"),
            create = TRUE,
            persist = FALSE
          )
        )
        ),

      # Plot for production by year on only one year
      conditionalPanel(
        condition = "input.plotType == 'Production by Year'",
        helpText("Select a single year:"),
        selectInput(
          "yearInput", "Year:",
          choices = all_years,
          selected = 1995 ## default and first year
        )
      )
    ),

    mainPanel(
      plotOutput("mainPlot")
    )
  )
)
