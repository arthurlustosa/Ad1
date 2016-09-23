library(shiny)
library(plotly)


shinyUI(fluidPage(
  titlePanel("Análise dos filmes por gênero entre 1902 e 2016"),
  sidebarPanel(
    selectInput("genre", "Genre (a movie can have multiple genres)",
                c("Action", "Adventure", "Animation","Children", "Comedy", "Crime", 
                  "Documentary", "Drama", "Fantasy", "Film-Noir", "Horror", "IMAX", 
                  "Musical", "Mystery", "Romance", "Sci-Fi", "Thriller","War","Western")
    ),
    sliderInput("year", "Year released", 1902, 2016, value = c(1902, 2016))
    
    
  ),
  mainPanel(
    plotlyOutput("trendPlot")
    #plotOutput("medianaPlot")
  )
))


