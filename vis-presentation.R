# Visualisation for presentation
library(ggplot2)
library(tidyverse)

vis_df <- readRDS("data/vis_df.rds")
vis_df$year <- as.factor(vis_df$year)
levels(vis_df$year) <- c("2001", "2006", "2011", "2016")

# Violins for Census insight
vis2 <- vis_df %>%
  filter(measure %in% c("Age15_19", "Age55_64"))

ggplot(vis2, aes(x=year, y=value, fill=year)) + 
  geom_violin() + facet_wrap(~measure, scales = "free_y", nrow = 1) + 
  labs(x = "Census year", y = "% of electorate population") + 
  theme(text=element_text(size=8),axis.text.x=element_text(size=6),axis.text.y=element_text(size=8))


vis3 <- vis_df %>%
  filter(measure %in% c("NoReligion"))

ggplot(vis3, aes(x=year, y=value, fill=year)) + 
  geom_violin() + facet_wrap(~measure, scales = "free_y", nrow = 1) + 
  labs(x = "Census year", y = "% of electorate population") + 
  theme(text=element_text(size=8),axis.text.x=element_text(size=6),axis.text.y=element_text(size=8))

