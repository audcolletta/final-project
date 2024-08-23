library(gtsummary)
library(tidyverse)
here::here()

/Users/johncolletta/Rbootcamp/Final Project/data/mlb-elo/mlb_elo.csv

library(readxl)
demographic_data <- read_excel("~/Rbootcamp/epi590r-in-class/demographic data.xlsx")
View(demographic_data)





#1 Create a {gtsummary} table of descriptive statistics about your data
tbl_summary(
	demographic_data,
	by = Cohort,
	include = c(Age, `Race/Ethnicity`, Gender, `Martial Status`, `Level of Education`, Income)
)



rlang::last_trace(drop = FALSE)

#2 Fit a regression and present well-formatted results from the regression (1 pt)
#The regression doesn’t have to be of any particular scientific interest,
#and you don’t have to interpret it in any particular way
#You may use {broom} or {gtsummary} or both
library(broom.helpers)
tbl_uvregression(
	olympics,
	y = age,
	include = c(sex, height, weight, team),
	method = lm)
# Option 1: tidytuesdayR package
## install.packages("tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('2024-02-06')
## OR
tuesdata <- tidytuesdayR::tt_load(2024, week = 6)

heritage <- tuesdata$heritage

# Option 2: Read directly from GitHub

heritage <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-02-06/heritage.csv')
view(heritage)
