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

# Create a subset, then graph

db_sub <- clean_db %>%
  filter(country_name %in% c("Afghanistan", "United States", "Japan", "Somalia")) %>%
  filter(age_group == "0-6 days", sex == "Both")

# Create basic linegraph

ggplot(data = db_sub, aes(x = year, y = deaths_per_100k)) +
  geom_line(aes(color = country_name))

ggsave(here("final_graphs", disease_graph.png))
