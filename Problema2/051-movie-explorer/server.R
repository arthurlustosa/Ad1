library(ggplot2)
library(ggvis)
library(dplyr)
  library(plotly)

# Set up handles to database tables on app start
dados <- read.csv("../../dados/ano-atual.csv")

#Selecionado dados
dados.deputados <- dados %>%
  select(sgPartido, txNomeParlamentar, sgUF, vlrDocumento, txtDescricao, txtFornecedor)

deputados.pb <- dados %>%
  filter(sgUF == "PB") %>%
  select(txNomeParlamentar, sgPartido) %>%
  distinct()

#filtrando os deputados da paraiba
deputados.pb <- c("AGUINALDO RIBEIRO", "BENJAMIN MARANHÃO", "DAMIÃO FELICIANO", "EFRAIM FILHO", "HUGO MOTTA", "LUIZ COUTO", "MANOEL JUNIOR", "MARCONDES GADELHA", "PEDRO CUNHA LIMA", "RÔMULO GOUVEIA", "VENEZIANO VITAL DO RÊGO", "WELLINGTON ROBERTO", "WILSON FILHO")

fornecedores.deputados.pb <- dados %>%
  filter(txNomeParlamentar %in% deputados.pb ) %>%
  select(txNomeParlamentar, txtCNPJCPF, txtFornecedor, txtDescricao, vlrDocumento) %>%
  mutate(txtCNPJCPF = as.factor(txtCNPJCPF)) %>%
  group_by(txNomeParlamentar, txtCNPJCPF, txtFornecedor, txtDescricao) %>%
  summarise(valor.total = sum(vlrDocumento)) %>%
  ungroup()

ggplot(data=fornecedores.deputados.pb,
       aes(x=reorder(txNomeParlamentar, valor.total), y=valor.total),fill = sgPartido)+ 
      geom_point(stat="identity") +
       coord_flip()




deputados.by.estado <- function(nome.estado) {
  dados.deputados %>%
    filter(sgUF == nome.estado)
    
}



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
    p <- plot_ly(deputados.by.estado(input$region), 
                 x = txNomeParlamentar, 
                 y = vlrDocumento, 
                 mode = "markers", 
                 text = paste("Fornecedor:", txtFornecedor),
                 size = vlrDocumento
    )
    p
    # style the xaxis
    #layout(p, xaxis = list(title = "Ratings", range = c(minx, maxx), autorange = F,
    #                      autotick = F, tick0 = minx, dtick = size))
  })
})