
# Upload data -------------------------------------------------------------



library(readxl)
X2017_Air_pollution <- read_excel("content/post/2017_Air_pollution.xlsx")
View(X2017_Air_pollution)


# Upload packages ---------------------------------------------------------


library(tidyverse)
library(hrbrthemes)
library(ggplot2)
library(scales)



# Prepare the data for geom_bar -------------------------------------------

names(X2017_Air_pollution)[2]<-"pollution"

Air_pollution<-X2017_Air_pollution%>%filter(Country %in%  c("Sub-Saharan Africa","South Asia", "Latin America & Caribbean", "Middle East & North Africa",
                                                            "North America",
                                                            "Euro area",
                                                            "East Asia & Pacific",
                                                            "European Union",
                                                            "Europe & Central Asia",
                                                            "OECD members","World")) %>%
  mutate (percentage=pollution/100) 





# Geom_bar - highllighted -------------------------------------------------


ggplot3<-Air_pollution %>% ggplot( aes(x=reorder(Country,percentage), y=percentage)) +
  geom_bar(stat="identity", aes(fill = Country %in%  c("Sub-Saharan Africa","South Asia", "Latin America & Caribbean", "Middle East & North Africa",
                                                       "North America",
                                                       "Euro area",
                                                       "East Asia & Pacific",
                                                       "European Union",
                                                       "Europe & Central Asia",
                                                       "OECD members")), width=0.6) +
  coord_flip() +
  theme_ipsum() +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position = "none",
    axis.text = element_text(hjust = 0.5),
    axis.text.x = element_blank(),
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5)
  ) + ylab("") +
  xlab("") +
  labs(
    title = "PM2.5 Air pollution analysis - 2017",
    subtitle = "Percent of population exposed to ambient concentrations of PM2.5 that exceed the WHO guideline value (% of total)",
    caption = "\n Source: https://data.worldbank.org
      Visualization: JuanmaMN (Twitter @Juanma_MN)",
    x = "",
    y = "") 

ggplot3 + geom_text(aes(label=percent_format()(percentage)), position=position_dodge(width=0.9), hjust=-0.3) 