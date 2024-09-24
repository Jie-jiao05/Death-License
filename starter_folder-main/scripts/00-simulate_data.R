#### Preamble ####
# Purpose: Paper 1 find topic
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

# Define the start and end date
start_date <- as.Date("2014-08-01")
end_date <- as.Date("2024-08-01")

# Set the number of random dates you want to generate
number_of_dates <- 100

# Generate random dates and death numbers
data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_dates,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "2000-01-01"
    ),
    number_of_marriage = rpois(n = number_of_dates, lambda = 15)
  )
data


#### Write_csv
write_csv(data, file = "starter_folder-main/data/raw_data/simulated.csv")


