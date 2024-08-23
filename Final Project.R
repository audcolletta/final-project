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
# Renaming the column to avoid issues with spaces
# These variables were giving me serious issues
demographic_data <- demographic_data %>%
	rename(Marital_Status = `Martial Status`)
demographic_data <- demographic_data %>%
	rename(Level_of_Education = `Level of Education`)
demographic_data <- demographic_data %>%
	rename(Race_Ethnicity = `Race/Ethnicity`)

# Now use the renamed column in tbl_uvregression
tbl_uvregression(
	demographic_data,
	y = Age,
	include = c(Race_Ethnicity, Gender, Marital_Status, Level_of_Education, Income),
	method = lm
)





