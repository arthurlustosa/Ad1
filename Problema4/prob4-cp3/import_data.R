import_data <- function() {
  movies.genre = read.csv("movie-genre.csv")
  filmes.ano = read.csv("filmes.ano.csv", stringsAsFactors = F)
  ratings = read.csv("ratings.csv")
  medianas.ano <- read.csv("medianas_filme.csv")
  filmes.ano = read.csv("filmes.ano.csv", stringsAsFactors = F)
  todos.generos.medianas <- read.csv("todos.generos.medianas.csv")
  dados.completo.filmes <- inner_join(filmes.ano, movies.genre, by="movieId")
  
}


