
library(flexdashboard)


library(readxl)
library(tidyr)
library(dplyr)
library(plotly)
library(scales)
library(readr)
library (tidyverse)
library(hrbrthemes)
library (ggridges)



data_plotly_GNIPC_LE <- read_csv("data_plotly_GNIPC_LE.csv")
View(data_plotly_GNIPC_LE)


ggplot_data_2<-data_plotly_GNIPC_LE %>% select (1,2,3,5) %>% filter (Year == 2016 & Continent %in% c("Africa", "Asia", "Europe", "N.America", "Oceania", "S.America"))


library(readr)
Life_Expectancy_Gender_gather_join <- read_csv("Life_Expectancy_Gender_gather_join.csv")


Life_Expectancy_Gender_gather_join_2016 <- Life_Expectancy_Gender_gather_join %>%filter(Year==2016  & Continent %in% c("Africa", "Asia", "Europe", "N.America", "Oceania", "S.America"))

g1<- ggplot(ggplot_data_2, aes(x=Life_Expectancy,y = reorder(Continent,desc(Continent)), fill = Continent, group = Continent)) +
  geom_density_ridges2() +
  theme_ipsum_rc()+
  labs(title = "Life Expectancy by Continent (2016)",
       subtitle = "Analysis with ggplot2, ggridges",
    caption = "\n Source:World Bank  | https://data.worldbank.org/
      Visualization: Juanma Martinez (Twitter @Juanma_MN)",
    x = "Life Expectancy",
    y = "") +
  scale_fill_brewer(palette = "Spectral") + theme(legend.position = "none")


g2<-ggplot(Life_Expectancy_Gender_gather_join_2016, aes(x=Life_Expectancy,y = reorder(Continent,desc(Continent)), fill = Gender, group = interaction(Continent, Gender)),width=800, height=700) +
  geom_density_ridges() + 
  theme_ipsum_rc()+
  labs(title = "Life Expectancy - Gender Analysis (2016)",
       subtitle = "Analysis with ggplot2, ggridges",
    caption = "\n Source:World Bank  | https://data.worldbank.org/
      Visualization: JuanmaMN (Twitter @Juanma_MN)",
    x = "Life Expectancy",
    y = "") 
# + scale_fill_brewer(palette = "Spectral")

library(cowplot)


plot_grid(g1,g2, labels = "AUTO")
