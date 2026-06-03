
# This dataset  comes from: https://www.kaggle.com/datasets/open-powerlifting/powerlifting-database?resource=download&select=openpowerlifting-2024-01-06-4c732975.csv. 

# It is a couple million of rows which is a little much for this exercise. I am going to restrict my analysis to looking:
# Males
# Lifted with out any equipment aids
# Were tested for what I assume to be performance enhancing drugs
# did the big three (Squat, Bench and Deadlift) at the competition

# All this script does is filter the original dataset as described and then save the resulting table as a CSV for me to do the EDA in separate script. 

# This script will not work if you try and run it without first downloading the data from Kaggle and renaming it as required.


setwd("~/GitHub/tidydojo/powerlifting")
library(tidyverse)

df <- read_csv("openpowerlifting-20240106.csv") %>% 
  janitor::clean_names() 

df %>% count(equipment, sex, tested, sort = TRUE)

lifters <- df %>% 
  filter(equipment == "Raw") %>% 
  filter(sex == "M") %>% 
  filter(tested == "Yes") %>% 
  filter(event == "SBD")

write_csv(lifters, "lifters.csv")
