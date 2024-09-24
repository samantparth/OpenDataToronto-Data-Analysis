#### Preamble ####
# Purpose: Testing the cleaned dataset, requires 02-data_cleaning.R to be ran first
# Author: Parth Samant
# Date: 21 September 2024
# Contact: parth.samant@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)

#### Test data ####

# tests that there are no "None" entries for BOTH ethnicity and race
all(cleaned_data$ethnicity_bias != "None" | cleaned_data$race_bias != "None" )



# tests that there is no N/A in the table

all(!is.na(cleaned_data))





