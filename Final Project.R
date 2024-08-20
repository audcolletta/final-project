library(gtsummary)
library(tidyverse)
here::here()

/Users/johncolletta/Rbootcamp/Final Project/data/mlb-elo/mlb_elo.csv
#1 Create a {gtsummary} table of descriptive statistics about your data
mlb <- read_csv(here::here( "data", "mlb-elo", "mlb_elo.csv"))
tbl_summary(
	mlb,
	by = playoff,
	include = c(season, neutral, elo1_pre, elo2_pre,
							elo_prob1, elo_prob2, elo1_post, elo2_post,))

table(mlb$season)
# Option 1: tidytuesdayR package
## install.packages("tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('2024-02-13')
## OR
tuesdata <- tidytuesdayR::tt_load(2024, week = 7)

historical_spending <- tuesdata$historical_spending
gifts_age <- tuesdata$gifts_age
gifts_gender <- tuesdata$gifts_gender


# Option 2: Read directly from GitHub

historical_spending <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-02-13/historical_spending.csv')
gifts_age <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-02-13/gifts_age.csv')
gifts_gender <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-02-13/gifts_gender.csv')
#1 Create a {gtsummary} table of descriptive statistics about your data
view(gifts_gender)
tbl_summary(
	gifts_gender,
	by = Gender,
	include = c(Candy, Flowers, Jewelry, GreetingCards))

