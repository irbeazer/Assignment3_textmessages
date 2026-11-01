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

## ---- Factorize variables ----

dat$Participant <- as.factor(dat$Participant)
dat$Group <- as.factor(dat$Group)

## ---- Transform data ----
# For ease of visualization, we transform the data to a long format

dat.long <- dat %>%
  pivot_longer(
    cols = c(Baseline, Six_months),
    names_to = 'Time',
    values_to = 'Values'
  )

# ---- Boxplot ----
# We want to make a boxplots stratified by both Group and Time

ggplot(dat.long, aes(Group, Values)) +
  geom_boxplot(color = 'black', fill = 'lightgrey',
               outliers = FALSE) +
  # geom_jitter(color = 'blue', width = 0.2) +
  theme_light() +
  coord_cartesian(ylim = c(0, max(dat.long$Values))) +
  scale_y_continuous(breaks = seq(0, max(dat.long$Values)*1.2, by = 10)) +
  labs(
    title = 'Boxplots of Text Messages',
    subtitle = 'Stratified by Group and Time-Period',
    x = 'Group',
    y = 'Number of Messages'
  ) +
  facet_wrap(~Time)+
  NULL

