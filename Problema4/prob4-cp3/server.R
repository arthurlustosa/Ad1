library(shiny)
library(ggplot2)
library(dplyr)
library(stringr)
library(reshape2)
library(plotly)
library(resample)

source("import_data.R")

import_data()

movies.genre = read.csv("movie-genre.csv")
filmes.ano = read.csv("filmes.ano.csv", stringsAsFactors = F)
ratings = read.csv("ratings.csv")
medianas.ano <- read.csv("medianas_filme.csv")
filmes.ano = read.csv("filmes.ano.csv", stringsAsFactors = F)
todos.generos.medianas <- read.csv("todos.generos.medianas.csv")
dados.completo.filmes <- inner_join(filmes.ano, movies.genre, by="movieId")


filmes.por.genero <- function(genero) {
  dados.completo.filmes %>%
    filter(genre == genero) %>%
    group_by(ano) %>%
    summarise(mediana.ano = median(rating)) %>%
    mutate(genre = genero) %>%
    distinct()
}

dados.completo.filmes <- dados.completo.filmes %>%
  select(movieId, title.x, ano, genre, rating, popularity) 

medianas.generos <- function(genre){
  todos.generos.medianas %>%
    filter(genero == genre)
}


shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({

    minyear <- input$year[1]
    maxyear <- input$year[2]
    
    dados <- filmes.por.genero(input$genre) %>%
      filter(ano>= minyear, ano <= maxyear)
    
    
    p <- plot_ly(dados, x = ano, y = mediana.ano)
    p %>%
      add_trace(y = fitted(loess(mediana.ano ~ as.numeric(ano))), x = ano) %>%
      layout(title = "Linha cronológica dos gêneros baseada na mediana das avaliações",
             showlegend = F) %>%
      dplyr::filter(mediana.ano == max(mediana.ano)) %>%
      layout(annotations = list(x = ano, y = mediana.ano, text = "Pico Max", showarrow = T))
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
      labs(title="\nIntervalo de Confiança da \nMediana das Avaliações dos Gêneros por Ano\n", x="Ano", y="Mediana")
    
  })
  
  output$compare2genres <- renderPlotly({
    
    g1 <- filmes.por.genero(input$genre1)
    g2 <- filmes.por.genero(input$genre2)
    
    if(input$genre1 != input$genre2){
      g <- rbind(g1, g2)
      
      p <- plot_ly(g, x = ano, y = mediana.ano, group = genre, colour = genre)
      p %>%
        layout(title = "Comparação entre dois gêneros",
               showlegend = TRUE)
      
    }else{
      
      p <- plot_ly(g1, x = ano, y = mediana.ano, group = genre, colour = genre)
      p %>%
        layout(title = "Comparação entre dois gêneros",
               showlegend = TRUE) %>%
        dplyr::filter(mediana.ano == max(mediana.ano))
      
    }
    
    
    

    
  })
  
})



