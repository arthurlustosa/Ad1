import_data <- function() {
  if (!exists("movies") || is.null(movies)) {
    movies = read.csv("dados/ml-latest-small/movies.csv")
    movies <- movies %>%
      mutate(
        year = str_sub(title, -5, -2)
      )
  }
  if (!exists("ratings") || is.null(ratings)) {
    rating = read.csv("dados/ml-latest-small/ratings.csv", stringsAsFactors = F)
  }
  movies.with.rating <- inner_join(movies, rating, by="movieId")
  movies.with.rating2 <- movie.genre %>%
    mutate(
      year = str_sub(title, -5, -2)
    )
  

}