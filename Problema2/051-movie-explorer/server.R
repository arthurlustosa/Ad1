library(ggplot2)
library(dplyr)
library(plotly)

# Set up handles to database tables on app start
dados <- read.csv("../../dados/ano-atual.csv")

#Selecionado dados
dados.deputados <- dados %>%
  select(sgPartido, txNomeParlamentar, sgUF, vlrDocumento, txtDescricao, txtFornecedor)

deputados.pb <- dados %>%
  filter(sgUF == "PB" ) %>%
  select(txNomeParlamentar, sgPartido) %>%
  distinct()


#deputados.by.estado <- function(nome.estado, partido) {
#    ifelse(partido == "TODOS",
#      dados.deputados %>% filter(sgUF == nome.estado),
#      dados.deputados %>% filter(sgUF == nome.estado) %>%  filter(sgPartido == partido))
#    
#}

deputados.by.estado <- function(nome.estado, partido) {
         dados.deputados %>% 
          filter(sgUF == nome.estado)

}


deputados.by.estado("PB", "TODOS")


minx <- min(movies$rating)
maxx <- max(movies$rating)

shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    # size of the bins depend on the input 'bins'
    size <- (maxx - minx) / input$bins
    
    cor <- c("TODOS","DEM", "PCdoB","PDT","PEN", "PHS","PMB","PMDB","PP","PPS","PR","PRB",
              "PROS","PRP","PRTB","PSB", "PSC", "PSD", "PSDB", "PSL", "PSOL", "PT", 
              "PTB", "PTdoB", "PTN", "PV", "REDE", "SD", "S.PART.", "NA")

  
    # a simple histogram of movie ratings
    p <- plot_ly(data = deputados.by.estado(input$region, input$partido),
                 x = txNomeParlamentar, 
                 y = vlrDocumento, 
                 mode = "markers", 
                 text = paste(sgPartido,
                              "</br>Empresa:", txtFornecedor),
                 size = vlrDocumento
    )
    p

  })
})