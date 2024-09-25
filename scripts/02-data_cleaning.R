#### Preamble ####
# Purpose: Organises ethnic groups into racial groups and removes unnecessary columns.
# Author: Parth Samant
# Date: 21 September 2024
# Contact: parth.samant@mail.utoronto.ca
# License: MIT
# Pre-requisites: None




#### Workspace setup ####
library(tidyverse)

#### Clean data ####
unedited_data <- read_csv("data/raw_data/Hate Crimes Open Data.csv")



# selecting for race, ethnicity, and year columns as those are the only relevant ones to this analysis
cleaned_data <-
  unedited_data |>
  janitor::clean_names() |>
  select(
    reported_year,
    race_bias,
    ethnicity_bias
  ) |>
  filter(race_bias != "None" | ethnicity_bias != "None")


# Putting ethnicities/Races into one column. If the race is "None" but there is an entry for ethnicity, the ethnicity is put in the race column.
for (i in 1:nrow(cleaned_data)) {
  if (cleaned_data$race_bias[i] == "None") {
    cleaned_data$race_bias[i] <- cleaned_data$ethnicity_bias[i]
  }
}





# to see which racial & ethnic groups exist in the dataset. This is used to help identify which ethnicities to group.
cleaned_data$race_bias |>
  unique()



# Assigns ethnicities into a larger racial group

cleaned_data <-
  cleaned_data |>
  mutate(
    race_bias =
      case_match(
        race_bias,
        "Black" ~ "Black",
        "Chinese" ~ "East/SE Asian",
        "Korean" ~ "East/SE Asian",
        "Indian" ~ "South Asian",
        "Pakistani" ~ "South Asian",
        "Sri Lankan" ~ "South Asian",
        "Iranian" ~ "West Asian/Middle Eastern",
        "Arab" ~ "West Asian/Middle Eastern",
        "Israeli" ~ "West Asian/Middle Eastern",
        "White" ~ "White",
        "Palestinian" ~ "West Asian/Middle Eastern",
        "East/Southeast Asian" ~ "East/SE Asian",
        "Filipino" ~ "East/SE Asian",
        "Afghan" ~ "West Asian/Middle Eastern",
        "Ukrainian" ~ "White",
        "Russian" ~ "White",
        "Latino" ~ "Latin American",
        "Mexican" ~ "Latin American",
        "Japanese" ~ "East/SE Asian",
        "South Asian" ~ "South Asian",
        "Middle Eastern" ~ "West Asian/Middle Eastern",
        .default = "Other/Multiracial"
      )
  )



#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
