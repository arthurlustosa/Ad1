library(ggplot2)
library(dplyr)
library(plotly)

# Set up handles to database tables on app start
dados <- read.csv("../../dados/ano-atual.csv")

#Selecionado dados
dados.deputados <- dados %>%
  filter(vlrDocumento > 0) %>%
  select(sgPartido, txNomeParlamentar, sgUF, vlrDocumento, txtDescricao, txtFornecedor)

deputados.by.estado <- function(nome.estado) {
  dados.deputados %>% filter(sgUF == nome.estado)
}



shinyServer(function(input, output) {

  output$trendPlot <- renderPlotly({
    p = qplot(
        x = txNomeParlamentar, 
        y = vlrDocumento, 
        data = deputados.by.estado(input$region), 
        colour=sgPartido,
        size=vlrDocumento,
        alpha=0.5,
        xlab = "Nome do deputado",
        ylab = "Valor total") +
        theme_grey(base_size = 10, base_family = "") +
        theme(plot.margin = unit(c(0.5, 0.5,0.5, 0.5), "cm"), axis.text.x = element_text(angle = 55, hjust = 1))  +
        ggtitle("Gastos dos Parlamentares")
      

    p

  })
})