## code to prepare `episode` dataset goes here
library(rvest)
library(tidyverse)

url <- "https://en.wikipedia.org/wiki/List_of_The_Handmaid%27s_Tale_episodes"

dat <- read_html(url) %>%
  html_table()

episode <- imap_dfr(dat[2:5], function(tab, season) {
  tab %>%
    select(1:6) %>%
    janitor::clean_names() %>%
    slice(seq(1, nrow(tab), by = 2)) %>%
    mutate(original_release_date = str_extract(original_release_date,
                                               "\\(.+\\)"),
           original_release_date = lubridate::ymd(original_release_date),
           no_overall = as.integer(no_overall),
           no_inseason = as.integer(no_inseason),
           title = str_extract(title, '[^"]+'),
           season = season)
})

usethis::use_data(episode, overwrite = TRUE)
