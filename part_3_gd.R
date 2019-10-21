# ---------------
# Gabriel De La Rosa
# Lab 4, part 3
# ---------------


library(tidyverse)
library(janitor)
library(here)


# Read in data:

db <- read_csv(here::here("data", "disease_burden.csv"))

clean_db <- db %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000)