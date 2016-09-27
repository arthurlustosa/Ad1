library(shiny)
library(plotly)


shinyUI(fluidPage(
  titlePanel("Análise dos filmes por gênero entre 1902 e 2016"),
  sidebarPanel(
    selectInput("genre", "Genero (a movie can have multiple genres)",
                c("Action", "Adventure", "Animation","Children", "Comedy", "Crime", 
                  "Documentary", "Drama", "Fantasy", "Film-Noir", "Horror", "IMAX", 
                  "Musical", "Mystery", "Romance", "Sci-Fi", "Thriller","War","Western")
    ),
    sliderInput("year", "Anos", 1902, 2016, value = c(1902, 2016))
    
    
  ),
  mainPanel(
    p("A proposta dessa visualização é mostrar uma linha cronológica de cada gênero, mostrando os pontos máximos e mínimos no decorrer do ano."),
    p(),
    plotlyOutput("trendPlot"),
    p("A segunda visualização nos mostra os intervalos de confiança calculados a partir da mediana das notas de cada gênero por ano. "),
    plotOutput("medianaPlot")
  )
))


