
# Make Multi-point “dumbbell” Plots in ggplot2 ----------------------------

# Upload the packages -----------------------------------------------------

library(readxl)
library(tidyr)
library(dplyr)
library(plotly)
library(scales)
library(readr)
library (tidyverse)
library(hrbrthemes)
library (ggridges)
library(ggalt)
library(readxl)

# Upload the data ---------------------------------------------------------


Exports <- read_excel("dumbbell/Exports.xls", col_types = c("text", 
                                                   "text", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric", "numeric", 
                                                   "numeric", "numeric", "numeric"))



names(Exports)[1]<- "Country"


Exports_gather<- Exports%>% select(1,`2000`, `2005`, `2015`)

names(Exports_gather)[2]<- "Second"
names(Exports_gather)[3]<- "Third"
names(Exports_gather)[4]<- "Fourth"


Exports2<-Exports_gather %>% filter (Country %in% c("Europe & Central Asia", "European Union", "Euro area",
                                                    "East Asia & Pacific",
                                                    "North America",
                                                    "Latin America & Caribbean",
                                                    "Middle East & North Africa",
                                                    
                                                    "Sub-Saharan Africa",
                                                    "South Asia")) %>%
  group_by(Country)%>%
  summarize(total_2000=sum(round(Second/1e6,0), na.rm = TRUE),
            total_2005=sum(round(Third/1e6,0), na.rm = TRUE),
            total_2015=sum(round(Fourth/1e6,0), na.rm = TRUE))


#Order the regions by Exports volume


Exports2$Country<- factor(Exports2$Country, levels = c("Sub-Saharan Africa","South Asia", "Latin America & Caribbean", "Middle East & North Africa",
                                                       "North America",
                                                       "Euro area",
                                                       "East Asia & Pacific",
                                                       "European Union",
                                                       "Europe & Central Asia"))


View(Exports2)
# plot --------------------------------------------------------------------



ggplot() +
 
  geom_segment(
    data = gather(Exports2, measure, val, -Country) %>% 
      group_by(Country) %>% 
      top_n(-1) %>% 
      slice(1) %>%
      ungroup(),
    aes(x = 0, xend = val, y = Country, yend = Country),
    linetype = "blank", size = 0.3, color = "gray80"
  ) +
  
  geom_segment(
    data = gather(Exports2, measure, val, -Country) %>% 
      group_by(Country) %>% 
      summarise(start = range(val)[1], end = range(val)[2]) %>% 
      ungroup(),
    aes(x = start, xend = end, y = Country, yend = Country),
    color = "gray80", size = 2
  ) +
  # reshape the data frame & plot the points
  geom_point(
    data = gather(Exports2, measure, value, -Country),
    aes(value, Country, color = measure), 
    size = 4
  )  + 
  #geom_text(data = filter(Exports2, Country== "East Asia & Pacific"),
  # aes(x = total_2000, y = Country),
  # label = "2000", fontface = "bold",
  # color = "#F7BC08",
  #vjust = -2) +
  #geom_text(data = filter(Exports2, Country == "East Asia & Pacific"),
  #aes(x = total_2005, y = Country),
  #label = "2005", fontface = "bold",
  #color = "#F7BC08",
  #vjust = -2)  +
  #geom_text(data = filter(Exports2, Country == "East Asia & Pacific"),
#aes(x = total_2015, y = Country),
#label = "2015", fontface = "bold",
#color = "#F7BC08",
#vjust = -2) +

geom_text(data = filter(Exports2, Country== "Europe & Central Asia"),
          aes(x = total_2000, y = Country),
          label = "2000", fontface = "bold",
          color = "#F7BC08",
          vjust = -2) +
  geom_text(data = filter(Exports2, Country == "Europe & Central Asia"),
            aes(x = total_2005, y = Country),
            label = "2005", fontface = "bold",
            color = "#F7BC08",
            vjust = -2)  +
  geom_text(data = filter(Exports2, Country == "Europe & Central Asia"),
            aes(x = total_2015, y = Country),
            label = "2015", fontface = "bold",
            color = "#F7BC08",
            vjust = -2) +
  theme_ft_rc(grid="X")  +
  labs(
    title = "Regional Trade Analysis",
    subtitle = "Exports of goods and services (current US$). World exports show a higher increase since 2000",
    caption = "\n Source: data.worldbank.org
      Visualization: JuanmaMN (Twitter @Juanma_MN)",
    x = "Exports of goods and services (Million - current US$)",
    y = "")   + theme(legend.position = "none")

