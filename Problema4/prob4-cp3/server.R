library(shiny)
library(ggplot2)
library(dplyr)
library(stringr)
library(reshape2)
library(plotly)
library(resample)

source("import_data.R")
import_data()


filmes.por.genero <- function(genero) {
  dados.completo.filmes %>%
    filter(genre == genero) %>%
    group_by(ano) %>%
    summarise(mediana.ano = median(rating)) %>%
    distinct()
}

dados.completo.filmes <- dados.completo.filmes %>%
  select(movieId, title.x, ano, genre, rating, popularity) 


shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    # size of the bins depend on the input 'bins'
    #size <- (maxx - minx) / input$bins
    
    p <- plot_ly(filmes.por.genero(input$genre), x = ano, y = mediana.ano)
    p %>%
      add_trace(y = fitted(loess(mediana.ano ~ as.numeric(ano))), x = ano) %>%
      layout(title = "Median duration of unemployment (in weeks)",
             showlegend = FALSE) %>%
      dplyr::filter(mediana.ano == max(mediana.ano)) %>%
      layout(annotations = list(x = ano, y = mediana.ano, text = "Peak", showarrow = T))
  })
  


  
 
})



