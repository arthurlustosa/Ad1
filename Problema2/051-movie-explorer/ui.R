library(shiny)
library(plotly)
library(ggplot2movies)  # Needed for the 'movies' data set

shinyUI(fluidPage(
  titlePanel("Gastos Deputados Federais | Jan-Jul 2016"),
  sidebarLayout(
    sidebarPanel(
      selectInput("region", "Estado:", 
                  c("PB","RR","CE","PE", "MG", "SE", "MT", "BA", "RS", "AC", 
                    "MA", "DF","RJ", "PR", "SP", "GO", "AM", "AP", "SC", "RN", 
                    "PA", "AL", "PI", "TO", "ES", "MS", "RO", "NA"))
      
    ),
    mainPanel(
      plotlyOutput("trendPlot")
    )
)
 
))


