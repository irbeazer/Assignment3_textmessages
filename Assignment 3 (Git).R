setwd("C:/Users/idara/OneDrive/Desktop/Brown University/Fall 2026/BHDS 2010 - Statistical Reasoning/Assignment3_textmessages")
Text_Messages <- read.csv("TextMessages.csv", header = TRUE)

library(tidyverse)

Text_Messages_long <- Text_Messages %>%
  pivot_longer( c(Baseline, Six_months),
                names_to = "Time",
                values_to = "TextMessages")


library(pastecs)
by(Text_Messages_long$TextMessages, 
   list (Text_Messages_long$Group, Text_Messages_long$Time), 
   function(X) round(stat.desc(X), 2))

library(ggplot2)

ggplot(Text_Messages_long, aes(x=Time, y=TextMessages, fill=Time)) +
  facet_wrap(~Group) +
  stat_summary(fun = mean, geom = "bar") +
  scale_fill_brewer(palette = "RdPu") +
  labs(title = "Average # of Text Messages by Group and Time",
       x = "Time", y = "Average # of Text Messages") +
  theme(plot.title = element_text(hjust = 0.5))