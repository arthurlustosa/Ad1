import_data <- function() {
  if (!exists("dados") || is.null(dados)) {
    dados <<- read.csv("ano-atual.csv")
  }
}