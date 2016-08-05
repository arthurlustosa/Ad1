library(shiny)
library(plotly)
library(ggvis)

shinyUI(fluidPage(
  titlePanel("Gastos Deputados Federais por estado"),
  sidebarLayout(
    sidebarPanel(
      p("Os dados utilizados na visualização são referentes aos gastos dos deputados
        federais de sua cota paralamentar mensal do período de janeiro a julho de 2016.
        A intenção é mostra de uma forma mais interativa os gastos dos deputados a partir
        de seu estado. É possível escolhe o estado e visualizar os seus respectivos deputados."),
      h4("Filtro"),
      selectInput("region", "Estado:", 
                  c("Paraíba - PB", "Acre - AC", "Alagoas - AL", "Amapá - AP", "Amazonas - AM", 
                    "Bahia - BA", "Ceará - CE", "Distrito Federal - DF", "Espírito Santo - ES", 
                    "Goiás - GO", "Maranhão - MA", "Mato Grosso - MT", "Mato Grosso do Sul - MS", 
                    "Minas Gerais - MG", "Pará - PA", "Paraná	PR", "Pernambuco - PE", "Piauí - PI", 
                    "Rio de Janeiro - RJ","Rio Grande do Norte - RN", "Rio Grande do Sul - RS", 
                    "Rondônia - RO", "Roraima - RR", "Santa Catarina - SC", "São Paulo - SP", 
                    "Sergipe - SE", "Tocantins - TO")),
      p("No lado esquerdo do gráfico é possível selecionar os partidos que se deseja observar,
        marcando ou desmarcando a sigla do partido. Em cada estado os deputados estão agrupados pelos
        seus partidos, utilizei o canal de cor para fazer esse agrupamento partidário. No eixo das abscissa
        temos os deputados e no das ordenadas uma escala de valores, correspondente aos gastos efetuados por eles.
        Cada ponto no gráfico representa um gasto que o parlamentar realizou.")
      ),
    
    mainPanel(
      plotOutput("trendPlot")
      
    )
)
 
))



