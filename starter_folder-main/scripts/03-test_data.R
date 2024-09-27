#### Preamble ####
# Purpose: simulate data test
# Author: Shanjie Jiao
# Date: 22 September 2024 
# Contact: shanjie.jiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)

#### Test data ####
data <- read_csv("~/Paper 1/starter_folder-main/data/raw_data/simulated.csv")

# Test for negative numbers
data$number_of_death |> min() <= 0

# Test for NAs
all(is.na(data$number_of_death))

# Test if each CIVIC_CENTRE is within the valid civic centers
check_civic_centres <- function(data) {
  all(data$CIVIC_CENTRE %in% valid_civic_centres)
}
is_valid <- check_civic_centres(data)
print(is_valid)

# Function to check if PLACE_OF_DEATH values are valid
check_places_of_death <- function(data) {
  all(data$PLACE_OF_DEATH %in% valid_places_of_death)
}
are_places_valid <- check_places_of_death(data)
print(are_places_valid)
