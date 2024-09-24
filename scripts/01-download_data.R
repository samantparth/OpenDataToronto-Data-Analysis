#### Preamble ####
# Purpose: Downloads Toronto Hate Crime Data onto RStudio
# Author: Parth Samant
# Date: 21 September 2024
# Contact: parth.samant@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

### Download Data ###

# get package
package <- show_package("hate-crimes-open-data")
package

# get all resources for this package
resources <- list_package_resources("hate-crimes-open-data")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
unedited_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
unedited_data


### Save Data ### 
write.csv(unedited_data, "data/raw_data/Hate Crimes Open Data.csv", row.names = FALSE) 
         
