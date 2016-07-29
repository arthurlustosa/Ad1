dados <- read.csv("../../dados/ano-atual.csv")

partidos <- dados %>%
  group_by(sgPartido) %>%
  distinct()

partidos <- c("DEM", "PCdoB","PDT","PEN", "PHS","PMB","PMDB","PP","PPS","PR","PRB","PROS","PRP","PRTB","PSB", "PSC", "PSD", "PSDB", "PSL", "PSOL", "PT", "PTB", "PTdoB", "PTN", "PV", "REDE", "SD", "S.PART.", "NA")

estados <- dados %>%
  group_by(sgUF) %>%
  distinct()

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

fornecedores.hugo.motta <- fornecedores.deputados.pb %>%
  filter(txNomeParlamentar == "HUGO MOTTA") %>%
  select(txtCNPJCPF, txtFornecedor, txtDescricao, valor.total) %>%
  group_by(txtCNPJCPF, txtFornecedor, txtDescricao) %>%
  summarise(valor.total = sum(valor.total)) %>% 
  ungroup() %>%
  distinct()

fornecedores.hugo.motta <- fornecedores.hugo.motta[ order(-fornecedores.hugo.motta[,4]), ]


minx <- min(fornecedores.hugo.motta$valor.total)
maxx <- max(fornecedores.hugo.motta$valor.total)

shinyServer(function(input, output) {
  
  output$trendPlot <- renderPlotly({
    # size of the bins depend on the input 'bins'
    size <- (maxx - minx) / input$bins
    
    # a simple histogram of movie ratings
    p <- plot_ly(fornecedores.hugo.motta, x = txtFornecedor, autobinx = F, type = "histogram",
                 xbins = list(start = minx, end = maxx, size = size))
    # style the xaxis
    layout(p, xaxis = list(title = "Ratings", range = c(minx, maxx), autorange = F,
                           autotick = F, tick0 = minx, dtick = size))
  })
})