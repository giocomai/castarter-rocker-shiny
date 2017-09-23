library('shiny')
library('tidyverse')

shinyUI(fluidPage(

  # Application title
  titlePanel("Frequency of terms in press releases issued by the EU commission"),
  sidebarLayout(
    sidebarPanel(
        textInput(inputId = 'term', label = 'Terms to be analysed', value = 'crisis, migrant')
    ),

    mainPanel(
       plotOutput("freqPlot")
    )
  )
))
