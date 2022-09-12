

#' @export
explore <- function() {
  path <- system.file("eda-app", package = "praise.be")
  shiny::runApp(path)
}
