#### Preamble ####
# Purpose: Runs tests on the cleaned data to make sure that the dataset was cleaned intended.
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

# Tests that ethnic groups in the dataset are assigned into proper group

check_race <- function(ethnicity_bias, race) {
  if (ethnicity_bias %in% c("Indian", "Pakistani", "Sri Lankan") && race == "South Asian") {
    return(TRUE)
  } else if (ethnicity_bias %in% c("Chinese", "Japanese", "Korean", "Filipino") && race == "East/SE Asian") {
    return(TRUE)
  } else if (ethnicity_bias %in% c("Mexican", "Latino") && race == "Latin American") {
    return(TRUE)
  } else if (ethnicity_bias %in% c("Palestinian", "Israeli", "Iranian", "Arab") && race == "West Asian/Middle Eastern") {
    return(TRUE)
  } else if (ethnicity_bias %in% c("Other") && race == "Other/Multiracial") {
    return(TRUE)
  } else {
    return(FALSE) # Returns FALSE if the race assignment is incorrect
  }
}







