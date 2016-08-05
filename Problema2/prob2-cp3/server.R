library(ggplot2)
library(dplyr)

source("import_data.R")
import_data()

#Selecionado dados
dados.deputados <- dados %>%
  filter(vlrDocumento > 0) %>%
  select(sgPartido, txNomeParlamentar, sgUF, vlrDocumento, txtDescricao, txtFornecedor)

deputados.by.estado <- function(nome.estado) {
  dados.deputados %>% filter(sgUF == nome.estado)
}

shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlot({
    estado = unlist(strsplit(input$region, " - ")) 
    p = qplot(
        x = txNomeParlamentar, 
        y = vlrDocumento, 
        data = deputados.by.estado(estado[2]), 
        colour=sgPartido,
        size=vlrDocumento,
        alpha=0.5,
        xlab = "Nome do deputado",
        ylab = "Valor total") +
        theme_grey(base_size = 12, base_family = "") +
        theme(plot.margin = unit(c(0.5, 0.5,0.5, 0.5), "cm"), 
              axis.text.x = element_text(angle = 55, hjust = 1),
              legend.position = "right")  +
        ggtitle("Gastos dos Parlamentares")
    p

  }
)
})

