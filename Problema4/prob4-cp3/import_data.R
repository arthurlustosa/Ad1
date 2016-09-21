import_data <- function() {
  if ((!exists("movies") || is.null(movies)) &&
      (!exists("rating") || is.null(rating))  &&
      (!exists("tags") || is.null(tags)) &&
      (!exists("links") || is.null(links))  &&
      (!exists("movie.genre") || is.null(movie.genre)) ){
    movies = read.csv("dados/ml-latest-small/movies.csv", stringsAsFactors = F)
    rating = read.csv("dados/ml-latest-small/ratings.csv", stringsAsFactors = F)
    tags = read.csv("dados/ml-latest-small/tags.csv", stringsAsFactors = F)
    links = read.csv("dados/ml-latest-small/links.csv", stringsAsFactors = F)
    movie.genre = read.csv("dados/movie-genre.csv", stringsAsFactors = F)
  }
}