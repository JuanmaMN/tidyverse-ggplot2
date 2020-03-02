
# Upload data -------------------------------------------------------------

library(readxl)
Happiness <- read_excel("Happiness.xlsx")
#View(Happiness)

names(Happiness)[3]<-"Happiness_Score"


# Packages ----------------------------------------------------------------

library(tidyverse)

#devtools::install_github("davidsjoberg/ggbump")

library(ggbump)
library(cowplot)
library(wesanderson)




# Prepare the data --------------------------------------------------------


data_2019<-Happiness%>%filter (Year == "2019") %>%top_n(10,Happiness_Score)


Happinessrank<-Happiness %>%
  group_by(Year) %>%
  # The * 1 makes it possible to have non-integer ranks while sliding
  mutate(rank = min_rank(-Happiness_Score) * 1) %>%
  ungroup()

View(Happinessrank)

data2<-Happinessrank%>%filter (Country %in% c("Finland", "Denmark","Norway","Iceland", "Netherlands",
                                              "Switzerland", "Sweden", "New Zealand", "Canada", "Austria"),
                               Year %in% c("2016","2017","2018","2019"))

data3<- data2%>%select(1,2,4)

View(data3)







# geom_bump ---------------------------------------------------------------

library("scales")

tableau_colours <- c('#1F77B4', '#FF7F0E', '#2CA02C', '#D62728', '#9467BD', '#8C564B', '#edd775', '#7F7F7F', '#BCBD22', '#17BECF')

ggplot(data3, aes(Year, rank, color = Country)) +
  geom_point(size = 7) +
  geom_text(data = data3 %>% filter(Year == min(Year)),
            aes(x = Year - .1, label = Country), size = 4, hjust = 1) +
  geom_text(data = data3 %>% filter(Year == max(Year)),
            aes(x = Year + .1, label = Country), size = 4, hjust = 0) +
  geom_bump(aes(smooth = 6), size = 1.5) +
  scale_y_reverse(limits = c(13, 1),
                     breaks = seq(1, 13, 1)) +
  scale_x_continuous(limits = c(2015.6, 2019.4),
                     breaks = seq(2016, 2019, 1)) +
  scale_color_manual(values = tableau_colours) +
  labs(y = "Rank",
       x = "",
       title = "Top 10 countries in 2019 - Yearly analysis",
       subtitle = "Analysis from 2016 to 2019 of the happiest countries in the world according to the World Happiness Report",
       caption = "Source:World Happiness Report 2019\nVisualization: JuanmaMN (Twitter @Juanma_MN)")  +

  guides(fill = NULL) +
  theme(
    plot.title = element_text(margin = margin(b = 8), 
                              color = "#22222b",face = "bold",size = 14,
                              hjust = 0.5,
                              family = "Arial"),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#22222b", size = 9, family = "Arial",
                                 hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10, family = "Arial",
                                 hjust = 0.95),
    axis.title.x = element_text(margin = margin(t = 10),
                                color = "#22222b"),
    axis.title.y = element_text(margin = margin(r = 15), 
                                color = "#22222b"),
    legend.position = "none",
    axis.text.x    = element_text(color = "#22222b"),
    axis.text.y    = element_text(color = "#22222b"),
    panel.background = element_blank(), 
    panel.grid.major = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#f7f7f7"),
    plot.margin = unit(c(1, 2, 2, 1), "cm"),
    axis.ticks = element_blank()
  ) 



