
#' @export
get_total_season <- function() {
  max(episode$season)
}

#' @export
get_total_episode <- function() {
  nrow(episode)
}

