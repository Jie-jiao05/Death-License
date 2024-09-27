#### Preamble ####
# Purpose: simulation
# Author: Shanjie Jiao
# Date: 22 September 2024
# Contact: shanjie.jiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)
library("anytime")

# Set the number of random dates you want to generate
number_of_dates <- 100

# Define the range for random dates
start_date <- as.Date("2014-05-01")
end_date <- as.Date("2024-09-30")

# Define the valid civic centers and places of death
valid_civic_centres <- c("NY", "ET", "SC", "TO")
valid_places_of_death <- c("Outside City Limits", "Toronto")

# Generate the random dates, death numbers, civic centers, and places of death
data <- tibble(
  dates = as.Date(
    runif(
      n = number_of_dates,
      min = as.numeric(start_date),
      max = as.numeric(end_date)
    ),
    origin = "1970-01-01"
  ),
  number_of_death = rpois(n = number_of_dates, lambda = 15),
  CIVIC_CENTRE = sample(valid_civic_centres, number_of_dates, replace = TRUE),
  PLACE_OF_DEATH = sample(valid_places_of_death, number_of_dates, replace = TRUE)
)

#### Write_csv
write_csv(data, file = "~/Desktop/Death-License-Project/Death_License_main_file/data/raw_data/simulated.csv")