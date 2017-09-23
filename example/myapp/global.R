library('shiny')
library('tidyverse')
library('castarter')

SetCastarter(project = "European Union", website = "European Commission")

# load dataset
dataset <- readRDS(file = file.path('data', 'dataset.rds')) %>%
    mutate(date = as.Date(date)) %>% arrange(date)

minDate <- min(dataset$date)
maxDate <- max(dataset$date)
