# Upload the packages -----------------------------------------------------

library(readr)
library(tidyverse)
library(hrbrthemes)
library(gganimate)
library(readxl)
library(scales)
library(readxl)
library(gifski)
library(lubridate)
library(ggthemes)
#devtools::install_github("EmilHvitfeldt/quickpalette")


# Upload the data ---------------------------------------------------------


GNI_24_11_2019 <- read_excel("GNI - 24.11.2019.xlsx")
View(GNI_24_11_2019)


# Prepare the data --------------------------------------------------------

GNI<-gather(GNI_24_11_2019, Year, GNI, 2:31)


data<-GNI%>% filter(Country %in% c("Sub-Saharan Africa","South Asia", "Latin America & Caribbean", "Middle East & North Africa",
                                   "North America",
                                   "Euro area",
                                   "East Asia & Pacific",
                                   "European Union",
                                   "Europe & Central Asia",
                                   "OECD members","World")) %>% drop_na()

data$GNI<-round((data$GNI),0)
#data$GNI<-dollar_format()(data$GNI)
data$Year<-year(data$Year)



data2 <- data %>%
  group_by(Year) %>%
  # The * 1 makes it possible to have non-integer ranks while sliding
  mutate(rank = min_rank(-GNI) * 1) %>%
  ungroup()

#View(data2)



# Animated ggplot ---------------------------------------------------------

ggplot3<-data2 %>% ggplot(aes(x=rank, y=GNI,group = Country)) +
  geom_bar(stat="identity", aes(fill = Country %in% c("Sub-Saharan Africa","South Asia", 
                                                      "Latin America & Caribbean", 
                                                      "Middle East & North Africa",
                                                                  "North America",
                                                                  "Euro area",
                                                                  "East Asia & Pacific",
                                                                  "European Union",
                                                                  "Europe & Central Asia",
                                                                  "OECD members")), width=0.6) +
  scale_fill_manual(values=c("#5f7ea0","#5f9ea0"))+
  coord_flip(clip = "off", expand = FALSE) +
  theme_ipsum() +
  #transition_reveal(Year) +
  transition_states(Year, transition_length = 3, state_length = 1) +
  ease_aes('cubic-in-out')+
  #view_follow(fixed_x = TRUE) +
  labs(
    title = 'GNI per capita, PPP (current international $) - {closest_state}',
    subtitle = 'Analysis by region',
    caption = '\n Source: data.worldbank.org
      Visualization: JuanmaMN (Twitter @Juanma_MN)',
    x = '',
    y = '')+ geom_text(aes(label=dollar_format()(GNI)),hjust=-0.5)+
  scale_x_reverse() +
  guides(color = FALSE, fill = FALSE) +
  geom_text(aes(y = 0, label = paste(Country, " ")), vjust = 0.2, hjust = 1) +
  theme(
    plot.title = element_text(margin = margin(b = 10), 
                              color = "#22222b",face = "bold",size = 17,
                              family = "Arial"),
    plot.subtitle = element_text(margin = margin(b = 25), 
                                 color = "#22222b", size = 12, family = "Arial"),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10, family = "Arial"),
    axis.title.x=element_blank(),
    axis.text.x=element_blank(),
    axis.ticks.x=element_blank(),
    axis.title.y =element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    legend.position = "none",
    #panel.background = element_blank(), panel.grid.major = element_blank(),
    #panel.grid.major.y = element_blank(),
    #panel.grid.minor = element_blank(), plot.background = element_rect(fill = "#f7f7f7"),
    plot.margin = margin(2,2,2,6, "cm")
  ) +
    annotate("rect", fill = "#add8e6", alpha = .1, 
           xmin =6.5, xmax = 9.5, 
           ymin = 28000, ymax = 65000) +
  annotate("text", x = 8, y = 30000, hjust = 0, size = 3.7,
           label = 'GNI per capita based on purchasing power parity (PPP).
           \nGNI is the sum of value added by all resident producers plus any product taxes
           \n(less subsidies) not included in the valuation of output plus net receipts of
           \n primary income (compensation of employees and property income) from abroad.')


 

a_gif3 <- animate(ggplot3, 
                  fps = 4, 
                  width = 1000, height = 750,renderer = gifski_renderer())

a_gif3
  