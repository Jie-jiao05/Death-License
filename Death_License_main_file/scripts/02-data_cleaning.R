#### Preamble ####
# Purpose: Cleans the raw data
# Author: Shanjie Jiao
# Date: 22 September 2024
# Contact: shanjie.jiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("~/Desktop/Death-License-Project/Death_License_main_file/data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  separate(
    col = time_period,
    into = c("year", "month"),
    sep = "-"
  ) |>
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-")))



#### Save data ####
write_csv(cleaned_data, "~/Desktop/Death-License-Project/Death_License_main_file/data/analysis_data/analysis_data.csv")