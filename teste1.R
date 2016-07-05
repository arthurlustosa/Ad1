library(ggplot2)

#carrega a base de dados iris
iris <- iris

# breve sumário sobre os dados
summary(iris)

a <- ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, shape = Species))
a <- a + geom_point(size=4)
a
ggplot(iris) + geom_point( aes(x=Sepal.Length, y=Petal.Length)) + 
  geom_point(size=4, aes(x=Sepal.Length, y=Petal.Length, col=Species, shape=Species)) + 
  xlab("Tamanho da Sépala") + 
  ylab("Tamanho da Pétala") + ggtitle("Íris")


#separando gráficos
ggplot(iris, aes(x=Sepal.Length, y=Petal.Length, col=Species, shape=Species)) + 
  geom_point(size=4, alpha=0.4) + 
  facet_wrap(~Species) + 
  xlab("Tamanho da Sépala") +
  ylab("Tamanho da Pétala") + 
  ggtitle("Espécies ~ Íris")


#carrega a base de dados economics
economics <- economics

#criando um histograma
x <- diff(range(economics$psavert))/30
ggplot(economics, aes(psavert)) + 
  geom_histogram(binwidth = x) + 
  geom_histogram(aes(fill=..count..))

#criando gráfico de linha
ggplot(economics, aes(x=date, y=unemploy)) + 
  geom_line() + 
  xlab("Ano") + 
  ylab("Desemprego (em milhares)") + 
  ggtitle("Desemprego - Economics")

#criando gráfico de barra
ggplot(iris, aes(Sepal.Width)) + geom_bar(aes(fill="pink"))

#criando gráficos de densidade
ggplot(economics) + geom_density(aes(pop), alpha=0.6)


install.packages("XML")
library("XML")
















