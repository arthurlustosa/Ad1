library(dplyr)
library(shiny)
library(plotly)
library(ggplot2movies)  # Needed for the 'movies' data set



shinyUI(fluidPage(
  titlePanel("Problema 2 - Checkpoint 3"),
  sidebarPanel(
    fluidRow(
      p("texto "),
      sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 10)
    )
  ),
  mainPanel(
    plotlyOutput("trendPlot")
  )
))