# ---- Load libraries and data ----
library(tidyverse)

dat <- read.csv('TextMessages.csv')
str(dat)
## The dataset has 4 variables, all classed as integers. 
## It appears that the the variable "Group" is a factor so this will need to be
## updated.
## There is a variable (Participant) indexing the participants
## The other two variables (Baseline, Six_months) are scores taken for each
## participant at different time periods.