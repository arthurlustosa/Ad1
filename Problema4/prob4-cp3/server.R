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

medianas.generos <- function(genre){
  todos.generos.mediadas %>%
    filter(genero == genre)
}


shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    # size of the bins depend on the input 'bins'
    #size <- (maxx - minx) / input$bins
    
    minyear <- input$year[1]
    maxyear <- input$year[2]
    
    dados <- filmes.por.genero(input$genre) %>%
      filter(ano>= minyear, ano <= maxyear)
    
    
    p <- plot_ly(dados, x = ano, y = mediana.ano)
    p %>%
      add_trace(y = fitted(loess(mediana.ano ~ as.numeric(ano))), x = ano) %>%
      layout(title = "Median duration of unemployment (in weeks)",
             showlegend = FALSE) %>%
      dplyr::filter(mediana.ano == max(mediana.ano)) %>%
      layout(annotations = list(x = ano, y = mediana.ano, text = "Peak", showarrow = T))
  })
  
  output$medianaPlot <- renderPlot({
    
    minyear <- input$year[1]
    maxyear <- input$year[2]
    
    g <- medianas.generos(input$genre) %>%
      filter(ano>= minyear, ano <= maxyear)
    
    g %>% 
      ggplot(aes(x = ano, ymin = limite.inferior, ymax = limite.superior)) +
      geom_errorbar(width = 3) +
      scale_x_continuous(breaks = pretty(g$ano, n = 15)) +
      labs(x="Ano do filme", y="Mediana")
    
  })
  
})





