library(dplyr)
library(ggplot2)
library(tidyr)
library(ggrepel)
library(grid)
library(gridExtra)
library(gtable)
library(tibble)
library(lubridate)
library(cowplot)
library(magick)

setwd('C:/Users/logan/Desktop/Summer2022/DataVisualization/DATA')

load("preprint_growth.rda") 
head(preprint_growth)


#a ) By using drop_na( ) and filter( ) on preprint_growth data frame, get the rows which have count greater
# than 0 and year later than 2004, and output it to another data frame called preprint_full.

preprint_growth %>% drop_na( ) %>% filter(count > 0) -> preprint_full


#(b) Use the filter function again to select the rows that have "bioRxiv", "F1000Research" in it only by looking at the
#example in the code above.

preprints <-preprint_full %>% filter(archive == "bioRxiv" | archive == "F1000Research")
preprints <-preprint_full %>% filter(archive %in% c("bioRxiv", "F1000Research")) %>%filter(count > 0) %>%mutate(archive = factor(archive, levels = c("bioRxiv", "F1000Research")))
preprints_final <- filter(preprints, date == ymd("2017-01-01"))


#(c) Draw line graphs for these two time series, "bioRxiv" and "F1000Research", by coloring them with "#7c6bea" and
#"#fe8d6d".
preprints_final2 <- filter(preprints, date == ymd("2017-01-01"))

ggplot(preprints) +
  aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) +
  scale_y_continuous(
    limits = c(0, 600), expand = c(0, 0),
    name = "preprints / month",
    sec.axis = dup_axis( #this part is for the second y axis
      breaks = preprints_final2$count, #and we use the counts to position our labels
      labels = c("F1000Researchv", "bioRxiv"),
      name = NULL)
  ) +
  scale_x_date(name = "year",
               limits = c(ymd("2014-02-01"), ymd("2017-01-01"))) +
  scale_color_manual(values = c("#7c6bea", "#fe8d6d"),
                     name = NULL) + ggtitle("Preprint Counts") + theme(legend.position = "right", plot.title = element_text(color="black", size=14))  


