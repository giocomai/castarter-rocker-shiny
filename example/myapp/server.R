library("shiny")
library("stringr")
library("scales")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$freqPlot <- renderPlot({
      castarter::ShowRelativeTS(terms = as.character(tolower(trimws(stringr::str_split(string = input$term, pattern = ",", simplify = TRUE)))),
                                dataset = dataset,
                                type = "graph",
                                rollingAverage = 91
                                ) + labs(title = paste("Frequency of", paste(sQuote(as.character(tolower(trimws(stringr::str_split(string = input$term, pattern = ",", simplify = TRUE))))), collapse = ", "), "in press releases issued by the EU commission"), subtitle = paste("Based on", scales::comma(nrow(dataset)), "press releases and speeches published by the EU commission between 1985 and 2017"))
  })

})
