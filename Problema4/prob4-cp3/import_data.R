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
  todos.generos.mediadas <- read.csv("../dados/todos.generos.mediadas.csv")

}


# action <- read.csv("../dados/generos_mediana/Action.csv")
# adventure <- read.csv("../dados/generos_mediana/Adventure.csv")
# Animation <- read.csv("../dados/generos_mediana/Animation.csv")
# Children <- read.csv("../dados/generos_mediana/Children.csv")
# Crime <- read.csv("../dados/generos_mediana/Crime.csv")
# Drama <- read.csv("../dados/generos_mediana/Drama.csv")
# Fantasy <- read.csv("../dados/generos_mediana/Fantasy.csv")
# Horror <- read.csv("../dados/generos_mediana/Horror.csv")
# IMAX <- read.csv("../dados/generos_mediana/IMAX.csv")
# Musical <- read.csv("../dados/generos_mediana/Musical.csv")
# Mystery <- read.csv("../dados/generos_mediana/Mystery.csv")
# Romance <- read.csv("../dados/generos_mediana/Romance.csv")
# Thriller <- read.csv("../dados/generos_mediana/Thriller.csv")
# War <- read.csv("../dados/generos_mediana/War.csv")
# Western <- read.csv("../dados/generos_mediana/Western.csv")
# #Comedy <- read.csv("../dados/Comedy.csv")
# #Documentary <- read.csv("../dados/Documentary.csv")
# 
# 
# 
# action <- action %>% mutate(genero = "Action")
# adventure <- adventure %>% mutate(genero = "Adventure")
# Animation <- Animation %>% mutate(genero = "Animation")
# Children <- Children %>% mutate(genero = "Children")
# Crime <- Crime %>% mutate(genero = "Crime")
# Drama <- Drama %>% mutate(genero = "Drama")
# Fantasy <- Fantasy %>% mutate(genero = "Fantasy")
# Horror <- Horror %>% mutate(genero = "Horror")
# IMAX <- IMAX %>% mutate(genero = "IMAX")
# Musical <- Musical %>% mutate(genero = "Musical")
# Mystery <- Mystery %>% mutate(genero = "Mystery")
# Romance <- Romance %>% mutate(genero = "Romance")
# Thriller <- Thriller %>% mutate(genero = "Thriller")
# War <- War %>% mutate(genero = "War")
# Western <- Western %>% mutate(genero = "Western")
# #Comedy <- Comedy %>% mutate(genero = "Comedy")
# #Documentary <- Documentary %>% mutate(genero = "Documentary")
# 
# 
# 
# todos.generos.mediadas <- rbind(action, adventure, Animation, Children, Crime, Drama, Fantasy, Horror, IMAX, Musical, Mystery, Romance, Thriller, War, Western)

write.csv(todos.generos.mediadas, file = paste("todos.generos.mediadas.csv", sep = ""))
