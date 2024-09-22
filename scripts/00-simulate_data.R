#### Preamble ####
# Purpose: Simulates data table of hate crime victims by ethnicity in Toronto
# Author: Parth Samant
# Date: 21 September 2024
# Contact: parth.samant@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed?


#### Workspace setup ####
library(tidyverse)




#### Simulate data ####




# I am assuming that each pan-ethnic group has the same distribution.

 simulation <- tibble(
  date = seq(from = 2018, to = 2023),
  black = round(rnorm(6, mean = 200, sd = 50)),
  white = round(rnorm(6, mean = 200, sd = 50)),
  south_asian = round(rnorm(6, mean = 200, sd = 50)),
  east_asian = round(rnorm(6, mean = 200, sd = 50)),
  southeast_asian = round(rnorm(6, mean = 200, sd = 50)),
  middle_eastern = round(rnorm(6, mean = 200, sd = 50)),
  latin_american = round(rnorm(6, mean = 200, sd = 50)),
  multiracial_other = round(rnorm(6, mean = 200, sd = 50))
  )
 
 
 #### Tests ####

 
 # tests that there are no negative entries
 simulation %>%
   summarise(across(everything(), ~ all(. >= 0)))
 
 # tests for NAs
 
 all(is.na(simulation))
 
 #
 
 
 
 
 
 
 


