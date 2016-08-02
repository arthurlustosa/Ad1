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


deputados.by.estado <- function(nome.estado, partido) {
      if(partido == "TODOS"){
        dados.deputados %>% filter(sgUF == nome.estado)
      }
      else{
        dados.deputados %>% filter(sgUF == nome.estado) %>%  filter(sgPartido == partido)
      }
}

a <- deputados.by.estado("PB", "TODOS")
a


#deputados.by.estado <- function(nome.estado, partido) {
#         dados.deputados %>% 
#          filter(sgUF == nome.estado)
#
#}


qplot(txNomeParlamentar, vlrDocumento, data=a, colour=sgPartido, size=vlrDocumento)
ggplotly()


shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    # size of the bins depend on the input 'bins'
    #size <- (maxx - minx) / input$bins
    
    cor <- c("TODOS","DEM", "PCdoB","PDT","PEN", "PHS","PMB","PMDB","PP","PPS","PR","PRB",
              "PROS","PRP","PRTB","PSB", "PSC", "PSD", "PSDB", "PSL", "PSOL", "PT", 
              "PTB", "PTdoB", "PTN", "PV", "REDE", "SD", "S.PART.", "NA")

    p = qplot(
        txNomeParlamentar, 
        vlrDocumento, 
        data=deputados.by.estado(input$region, input$partido), 
        colour=sgPartido, 
        size=vlrDocumento,
        alpha=0.5)
    
    # a simple histogram of movie ratings
    #p <- plot_ly(data = deputados.by.estado(input$region, input$partido),
    #             x = txNomeParlamentar, 
    #             y = vlrDocumento, 
    #             mode = "markers", 
    #             text = paste(sgPartido,
    #                          "</br>Empresa:", txtFornecedor),
    #             size = vlrDocumento
    #)
    p

  })
})