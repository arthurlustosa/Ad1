library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Gastos Deputados Federais | Jan-Jul 2016"),
  sidebarLayout(
    sidebarPanel(
      h4("Filtro"),
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

