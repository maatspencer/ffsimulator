library(ffpros) # https://ffpros.dynastyprocess.com
library(tidyverse)
library(ffscrapr)

fp_set_ratelimit(rate_limit = FALSE)

seasons <- 2016:2020

pages <- c(
  "qb-cheatsheets",
  "ppr-rb-cheatsheets",
  "ppr-wr-cheatsheets",
  "ppr-te-cheatsheets",
  "k-cheatsheets",
  "dst-cheatsheets",
  "dl-cheatsheets",
  "lb-cheatsheets",
  "db-cheatsheets"
)

fp_rankings_history <- crossing(pages, seasons) %>%
  mutate(rankings = map2(pages, seasons, ~ fp_rankings(page = .x, year = .y))) %>%
  unnest(rankings) %>%
  transmute(
    page_pos =
      str_remove_all(pages, "cheatsheets|^ppr|\\-") %>%
        toupper() %>%
        str_squish(),
    season = seasons,
    fantasypros_id = as.character(fantasypros_id),
    sportradar_id,
    player_name = dp_cleannames(player_name),
    pos = case_when(
      pos %in% c("CB", "S") ~ "DB",
      pos %in% c("OLB", "LB") ~ "LB",
      pos %in% c("DE", "DT", "NT") ~ "DL",
      TRUE ~ pos
    ),
    team,
    rank,
    ecr,
    sd
  ) %>%
  filter(page_pos == pos)

seasons2 <- 2012:2015
pages2 <- c(
  "qb-cheatsheets",
  "rb-cheatsheets",
  "wr-cheatsheets",
  "te-cheatsheets",
  "k-cheatsheets",
  "dst-cheatsheets"
)

fp_rankings_history2 <- crossing(pages2, seasons2) %>%
  mutate(rankings = map2(pages2, seasons2, ~ fp_rankings(page = .x, year = .y))) %>%
  unnest(rankings) %>%
  transmute(
    page_pos =
      str_remove_all(pages2, "cheatsheets|^ppr|\\-") %>%
        toupper() %>%
        str_squish(),
    season = seasons2,
    fantasypros_id = as.character(fantasypros_id),
    sportradar_id,
    player_name = dp_cleannames(player_name),
    pos,
    team,
    rank,
    ecr,
    sd
  ) %>%
  filter(page_pos == pos)

fp_rankings_history <- bind_rows(fp_rankings_history2, fp_rankings_history)

usethis::use_data(fp_rankings_history, overwrite = TRUE)
