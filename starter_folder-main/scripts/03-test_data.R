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
data <- read_csv("starter_folder-main/data/raw_data/simulated.csv")

# Test for negative numbers
data$number_of_death |> min() <= 0

# Test for NAs
all(is.na(data$number_of_death))