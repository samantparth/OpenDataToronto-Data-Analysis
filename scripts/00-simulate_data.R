#### Preamble ####
# Purpose: Simulates data table of hate crime victims by ethnicity in Toronto
# Author: Parth Samant
# Date: 21 September 2024
# Contact: parth.samant@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed?

set.seed("304")

#### Workspace setup ####
library(tidyverse)




#### Simulate data ####




# I am assuming that each group is from a normal distribution (with the realizations being whole numbers), since I assume that most realisations are around a certain number.
# Although it is likely that certain groups may follow a different distribution, I do not know which groups vary and by how much (thus, I assume they have the same parametres).

 simulation <- tibble(
  date = sample(x = c(2018, 2019, 2020, 2021, 2022, 2023), size = 50, replace = TRUE),
  ethnicity = sample(x = c("None", "Black", "Chinese", "Korean", "Indian", "Pakistani", "Sri Lankan", "Iranian", "Arab", "Israeli", "White", "Palestinian", "East/Southeast Asian", "Filipino", "Afghan", "Ukrainian", "Russian", "Latino", "Mexican", "Japanese", "South Asian"), size = 50, replace = TRUE),
  race = ethnicity
  )

 

 # assigns ethnicities to a racial group
 simulation <-
   simulation |>
   mutate(
     race =
       case_match(
         race,
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
         .default = "Other/Multiracial"
       )
   )
 

 
 
 
 
 #### Tests ####

 
 # tests that there are no "None" entries for BOTH ethnicity and race
 all(simulation$ethnicity != "None" | simulation$race != "None" )
   
   
 
 # tests that there is no N/A in the table
 
 all(!is.na(simulation))
 
 
 
 
 
 
 
 
 
 
 


