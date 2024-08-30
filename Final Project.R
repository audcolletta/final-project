library(gtsummary)
library(tidyverse)
here::here()
demographic_data <- read_excel(here::here("data", "demographic data.xlsx"))
library(readxl)

View(demographic_data)


# Renaming the column to avoid issues with spaces
# These variables were giving me serious issues
demographic_data <- demographic_data %>%
	rename(Marital_Status = `Martial Status`)
demographic_data <- demographic_data %>%
	rename(Level_of_Education = `Level of Education`)
demographic_data <- demographic_data %>%
	rename(Race_Ethnicity = `Race/Ethnicity`)
demographic_data <- demographic_data %>%
	rename(cohort = `Cohort`)


#1 Create a {gtsummary} table of descriptive statistics about your data
 Summary_stats <- tbl_summary(
	demographic_data,
	by = cohort,
	include = c(Age, Race_Ethnicity, Gender, Marital_Status, Level_of_Education, Income)
)



#2 Fit a regression and present well-formatted results from the regression (1 pt)
#The regression doesn’t have to be of any particular scientific interest,
#and you don’t have to interpret it in any particular way
#You may use {broom} or {gtsummary} or both
library(broom.helpers)


# Now use the renamed column in tbl_uvregression
tbl_uvregression(
	demographic_data,
	y = Age,
	include = c(Race_Ethnicity, Gender, Marital_Status, Level_of_Education, Income),
	method = lm
)

#3 Create a figure (1 pt) It doesn’t need to look pretty;
#feel free to adapt some of the examples from class, which were as simple as hist(data$variable)
#x must be numeric (learned the hard way)
hist(demographic_data$Age)

#4 Write and use a function that does something with the data (1 pt)
#It could be as simple as, for example, a new function that you write
#by hand to calculate the standard deviation of a variable (like we did with the mean)
inline_text(Summary_stats, variable = "Age", column = "stat_1")
#[1] "77 (76, 82)"
inline_text(Summary_stats, variable = "Age", column = "stat_2")
#[1] "73 (70, 75)"

#5Create and render a quarto document that includes at least:
#The table, regression results, and figure, with appropriate captions (1 pt)
#Inline R code in at least 2 places, 1 pulling a statistic
	#from a table (i.e., using gtsummary::inline_text())
	#and 1 printing something else (like we did with the mean age in the example) (1 pt)
#Cross-references to a table and a figure at least once each (1 pt)
#A brief description of the data, including its source (1 pt)


