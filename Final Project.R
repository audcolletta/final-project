library(gtsummary)
library(tidyverse)
here::here()

/Users/johncolletta/Rbootcamp/Final Project/data/mlb-elo/mlb_elo.csv

# Option 1: tidytuesdayR package
## install.packages("tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('2024-08-06')
## OR
tuesdata <- tidytuesdayR::tt_load(2024, week = 32)

olympics <- tuesdata$olympics


# Option 2: Read directly from GitHub

olympics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-08-06/olympics.csv')
#1 Create a {gtsummary} table of descriptive statistics about your data
tbl_summary(
	olympics,
	by = sex,
	include = c(age, height, weight, team))

#2 Fit a regression and present well-formatted results from the regression (1 pt)
#The regression doesn’t have to be of any particular scientific interest,
#and you don’t have to interpret it in any particular way
#You may use {broom} or {gtsummary} or both
