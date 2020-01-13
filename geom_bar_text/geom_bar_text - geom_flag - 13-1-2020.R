# Upload the data ---------------------------------------------------------

library(readxl)
Happiness <- read_excel("Happiness.xlsx")
View(Happiness)
names(Happiness)[3]<-"Happiness_Score"


# Prepare the data --------------------------------------------------------

library(tidyverse)
data_2019<-Happiness%>%filter (Year == "2019") %>%top_n(10,Happiness_Score)

data_2019$code=c("fi","dk","no", "is", "nl","ch","se","nz","ca","at")



# ggflag ------------------------------------------------------------------

library(ggflags)

# https://github.com/rensa/ggflags   for flags
library(countrycode)


library(ggfittext)
library(scales)


ggplothp<-data_2019 %>% ggplot(aes(x=fct_reorder(Country,Happiness_Score), y=Happiness_Score,group = Country,
                                   fill= factor(Country))) +
  #geom_bar(stat="identity", fill="#69b3a2", width=0.6) +
  geom_flag(y = -.5, aes(country = code), size = 8, hjust = -2) +
  #geom_text(nudge_y = 0.2, color = "darkred", size = 5) +
  scale_fill_manual(values = c( "Finland" = "#4e79a7",
                                "Denmark" = "#76B7B2",    
                                "Norway"      = "#76B7B2",
                                "Iceland"     = "#76B7B2",
                                "Netherlands" = "#76B7B2",
                                "Switzerland" = "#76B7B2",
                                "Sweden"      = "#76B7B2",
                                "New Zealand" = "#76B7B2",
                                "Canada"= "#76B7B2",
                                "Austria" = "#76B7B2"))+
  coord_flip()+
  #coord_flip(clip = "off", expand = FALSE)  +
  geom_col(width = 0.8) +
  geom_bar_text(place = "right", contrast = TRUE, size=10,
                aes(label=paste0(Country, "  ",round(Happiness_Score,3))))  + 
  labs(x = "",y = "",
       title = "Finland - Happiest country in the world in 2019",
       subtitle = "The World Happiness Report ranked Finland as the happiest country in the world in 2019",
       caption = "Source:World Happiness Report 2019\nVisualization: JuanmaMN (Twitter @Juanma_MN)") +
  #scale_x_discrete(position = "top") +
  guides(fill = NULL) +
  ylim(-1, 8)+
  theme(
    plot.title = element_text(margin = margin(b = 10), 
                              color = "#22222b",face = "bold",size = 14,
                              hjust = 0.5,
                              family = "Arial"),
    plot.subtitle = element_text(margin = margin(t=10,b = 25), 
                                 color = "#22222b", size = 9, family = "Arial",
                                 hjust = 0.5),
    plot.caption =  element_text(margin = margin(t = 20), 
                                 color = "#22222b", size = 10, family = "Arial",
                                 hjust = 0.95),
    legend.position = "none",
    axis.text.x  = element_blank(),
    axis.text.y    = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(), 
    plot.background = element_rect(fill = "#f7f7f7"),
    plot.margin = unit(c(2, 2, 2, 1), "cm"),
    axis.ticks = element_blank()
  ) 

ggplothp