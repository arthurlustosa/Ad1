library(shiny)
library(ggplot2)
library(dplyr)
library(stringr)

source("import_data.R")
import_data()

#Perguntas
#Pergunta 3
#A partir da classificação dos anos pelos gêneros dos filmes, conseguiríamos traçar uma linha cronológica de cada gênero. Mais especificamente, mostraríamos os altos de baixos de cada gênero.
#Resposta 3
#Acredito que conseguiremos plotar essa linha cronológica de cada gênero, mostrando os picos de cada um.

#Pergunta 4
#Analisando os outros dados fornecidos, verificando o ano, conseguiríamos dizer quais gêneros fizeram mais sucesso a partir da quantidade de público que eles tiveram?

#Resposta 4
#Essa é uma análise simples, acredito que conseguiremos montar um ranking dos gêneros mais populares a partir de cada ano.




# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})
