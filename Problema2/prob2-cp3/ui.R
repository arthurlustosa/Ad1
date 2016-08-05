library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Gastos Deputados Federais"),
  sidebarLayout(
    sidebarPanel(
      p("Os dados utilizados na visualização são referentes aos gastos dos deputados
        federais de sua cota paralamentar mensal do período de janeiro a julho de 2016.
        A intenção é mostra de uma forma mais interativa os gastos dos deputados a partir
        de seu estado. É possível escolhe o estado e visualizar os seus respectivos deputados."),
      h4("Filtro"),
      selectInput("region", "Estado:", 
                  c("PB","RR","CE","PE", "MG", "SE", "MT", "BA", "RS", "AC", 
                    "MA", "DF","RJ", "PR", "SP", "GO", "AM", "AP", "SC", "RN", 
                    "PA", "AL", "PI", "TO", "ES", "MS", "RO", "NA")),
      p("No lado esquerdo do gráfico é possível selecionar os partidos que se deseja observar,
        marcando ou desmarcando a sigla do partido. Em cada estado os deputados estão agrupados pelos
        seus partidos, utilizei o canal de cor para fazer esse agrupamento partidário. No eixo das abscissa
        temos os deputados e no das ordenadas uma escala de valores, correspondente aos gastos efetuados por eles.
        Cada ponto no gráfico representa um gasto que o parlamentar realizou. Na caixa de texto que é exibida,
        temos o valor do gasto, a empresa em que esse gasto foi realizado e o tipo desse gasto.")
      ),
    
    mainPanel(
      plotlyOutput("trendPlot")
    )
)
 
))



