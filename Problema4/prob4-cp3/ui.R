library(shiny)
library(plotly)


shinyUI(fluidPage(
  titlePanel("      Análise dos Gêneros Cinematográficos entre 1902 e 2016"),
  sidebarPanel(
    h4("Os dados"),
    p("Os dados são referentes a filmes e suas avaliações feitas por usuários entre os anos 1996 ate 2016. Os dataset possui filmes dos anos de 1902 até 2016."),
    h4("Questão 1"),
    p("Seria possível traçar uma linha cronológica de cada gênero mostrando os pontos máximos e então visualizarmos o comportamento de cada gênero nos respectivos anos.
No primeiro gráfico conseguimos visualizar como os gêneros se comportam nos anos. Temos um traço (linha laranja) que normaliza a variação do comportamento dos valores. 
"),
    p("Por exemplo, esse primeiro gráfico nos mostra o comportamento do gênero Ação desde 1902 até 2015, vemos o ponto máximo no ano de 1948 e o mínimo no ano de 1991. Observamos também que o gênero ação sofre uma queda a partir de 1969, porém desde os anos 90 começa a subir no gosto popular."),
    h4("Para iniciar a visualização:"),
    h5("Escolha o gênero que você deseja visualizar a linha do tempo"),
    selectInput("genre", "Gênero",
                c("Action", "Adventure", "Animation","Children", "Comedy", "Crime", 
                  "Documentary", "Drama", "Fantasy", "Film-Noir", "Horror", "IMAX", 
                  "Musical", "Mystery", "Romance", "Sci-Fi", "Thriller","War","Western")
    ),
    h5("Escolha um intervalo de tempo entre os anos abaixo"),
    sliderInput("year", "Anos", 1902, 2016, value = c(1902, 2016)),
    p("Na segunda visualização, propomos exibir os intervalos de confiança medidos a partir da mediana de cada gênero no ano correspondente. Essa estratégia visa agregar mais confiança ao gráfico mostrado acima, visto que, ao anasilarmos os intervalos de confiança conseguimos afirmar, com mais segurança, os resultados obtidos."),
    
    p(" "),
    p(" "),
    p(" "),
    h4("Questão 2"),
    p("Ao comparar o comportamento de dois gêneros conseguimos inferir qual dos dois obteve um melhor comportamento? 
A partir da validação dos resultados obtivos na primeira questão pelo gráfico dos intervalos de confiança, conseguimos observar com clareza o comportamento de dois gêneros no decorrer dos anos. Podemos ver quais tiveram um crescimento ou queda."),
    selectInput("genre1", "Gênero 1",
                c("Action", "Adventure", "Animation","Children", "Comedy", "Crime", 
                  "Documentary", "Drama", "Fantasy", "Film-Noir", "Horror", "IMAX", 
                  "Musical", "Mystery", "Romance", "Sci-Fi", "Thriller","War","Western")
    ),
    selectInput("genre2", "Gênero 2",
                c("Comedy", "Adventure", "Action", "Animation","Children", "Crime", 
                  "Documentary", "Drama", "Fantasy", "Film-Noir", "Horror", "IMAX", 
                  "Musical", "Mystery", "Romance", "Sci-Fi", "Thriller","War","Western")
    ),
    p("Por exemplo, temos a comparação entre os gêneros de ação e comédia, observamos que eles possuem um comportamento parecido em alguns anos, mas em outros nem tanto."),
    h4("Resultados"),
    p("Os resultados obtidos nas tentativas de resposta das duas questões foram bastante satisfatórios. Conseguimos observar de forma clara o comportamento dos gêneros cinematográficos no decorrer dos anos. Porém ao tentar responder as questões mostradas acima chegamos a outros questionamentos: Seria possível responder quais fatores influenciaram o crescimento ou decaimento de determinado gênero? Quais gêneros possuem mais correlação e quais não possuem?"),
    p("Acreditamos que essas questões podem ser respondidas no futuro.")
    
    
    
  ),
  mainPanel(
    p("\n"),
    plotlyOutput("trendPlot"),
    p("\n"),
    plotOutput("medianaPlot"),
    p("\n"),
    p("\n"),
    p("\n"),
    p("\n"),
    plotlyOutput("compare2genres")
  )
))


