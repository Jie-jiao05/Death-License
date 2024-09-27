#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Shanjie Jiao
# Date: 22 September 2024
# Contact: shanjie.jiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? No


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

show_all_dataset <- list_packages(100)
show_all_dataset

#### Download data ####
# get package
package <- show_package("cba07a90-984b-42d2-9131-701c8c2a9788")
resources <- list_package_resources("cba07a90-984b-42d2-9131-701c8c2a9788")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c("csv"))

# load the first datastore resource as a sample
loaded_data <- filter(datastore_resources, row_number() == 1) %>%
  get_resource()


#### Save data ####
write_csv(loaded_data, "~/Desktop/Death-License-Project/Death_License_main_file/data/raw_data/raw_data.csv")