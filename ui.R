ui <- fluidPage(
  titlePanel("Dynamic Honey Data Visualization"),

  sidebarLayout(
    sidebarPanel(
      # Which plot do we want?
      selectInput(
        "plotType", "Choose a Plot:",
        choices = c(
          "Colonies vs Production",
          "Time Series Colonies vs Production",
          "Production by Year"
        )
      ),

      # Conditional UI for "Colonies vs Production" (multiple states)
      conditionalPanel(
        condition = "input.plotType == 'Colonies vs Production'",
        helpText("Select one or more states:"),
        shinyWidgets::pickerInput(
          inputId = "states_colonies",
          label = "States:",
          choices = all_states,
          multiple = TRUE,
          selected = c("Alabama", "California"), # default choices
          options = list(
            plugins = list("remove_button"),
            create = TRUE,
            persist = FALSE
          )
        )
      ),

      # Conditional UI for "Time Series Colonies vs Production" (up to two states)
      conditionalPanel(
        condition = "input.plotType == 'Time Series Colonies vs Production'",
        helpText("Select up to two states:"),
        shinyWidgets::pickerInput(
          inputId = "states_time",
          label = "States:",
          choices = all_states,
          multiple = TRUE,
          selected = c("Alabama", "California"),
          options = list(
            plugins = list("remove_button"),
            create = TRUE,
            persist = FALSE
          )
        )
        ),

      # Conditional UI for "Production by Year" (single year)
      conditionalPanel(
        condition = "input.plotType == 'Production by Year'",
        helpText("Select a single year:"),
        selectInput(
          "yearInput", "Year:",
          choices = all_years,
          selected = 1995
        )
      )
    ),

    mainPanel(
      plotOutput("mainPlot")
    )
  )
)
