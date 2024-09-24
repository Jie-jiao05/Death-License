#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Shanjie Jiao
# Date: 22 September 2024 
# Contact: shanjie.jiao@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("starter_folder-main/data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
  )


#### Save data ####
write_csv(cleaned_data, "starter_folder-main/data/analysis_data/analysis_data.csv")
