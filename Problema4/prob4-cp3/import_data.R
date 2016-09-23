import_data <- function() {
  if (!exists("movies") || is.null(movies)) {
    movies = read.csv("../dados/ml-latest-small/movies.csv")
    movies.genre = read.csv("../dados/movie-genre.csv")
  }
  if (!exists("ratings") || is.null(ratings)) {
    ratings = read.csv("../dados/ml-latest-small/ratings.csv")
  }
  medianas.ano <- read.csv("../dados/medianas_filme.csv")
  filmes.ano = read.csv("../dados/filmes.ano.csv", stringsAsFactors = F)
  dados.completo.filmes <- inner_join(filmes.ano, movies.genre, by="movieId")
  
  filmes.ano = merge(filmes.ano, dados.completo.filmes)
  filmes.ano <- filmes.ano %>%
    mutate(ano = as.numeric(filmes.ano$ano)) %>% 
    select(movieId, title.x, ano, genre, popularity, rating)
  
  


}







