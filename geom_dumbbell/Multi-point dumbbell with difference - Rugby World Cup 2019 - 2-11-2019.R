
# Upload the data ---------------------------------------------------------

library(readxl)
library(tidyverse)
library(readxl)
library(tidyverse)
library(ggplot2)
library(gridExtra)
library(ggalt)
library(scales)
library(hrbrthemes)

Avg_2 <- read_excel("Avg_2.xlsx")
View(Avg_2)


# Prepare data for geom_dumbbell ------------------------------------------

Avg_22<- Avg_2 %>% select(1,6,7) %>% filter(Team %in% c("South Africa", "Australia", "Ireland",
                                                        "Japan", "New Zealand",
                                                        "England", "France","Wales"))

colnames(Avg_22)

Avg_223<-Avg_22%>% mutate (diff=round(Avg_Tries_Pool-Avg_Tries_KO,1),
                           label=ifelse(diff>0, paste0("+",diff), paste0(diff)))



View(Avg_223)
colnames(Avg_223)

Avg_223$Avg_Tries_KO<-round(Avg_223$Avg_Tries_KO,1)




View(Avg_223)
g<-ggplot(Avg_223, aes(x = Avg_Tries_Pool, xend = Avg_Tries_KO, y=reorder(Team,Avg_Tries_Pool))) + 
  geom_dumbbell(colour = "#dddddd",
                size = 3,
                colour_x = "#FAAB18",
                colour_xend = "#1380A1")+
  labs(x=NULL, y=NULL, title="ggplot2 geom_dumbbell with dot guide")  +
  labs(
    title = "Rugby World Cup 2019",
    subtitle = "Teams in Quarter-finals - Pool VS Knockout stages stats - Average number of tries",
    caption = "\n Source: Rugby World Cup
      Visualization: JuanmaMN (Twitter @Juanma_MN)",
    x = "",
    y = "") + theme(legend.position = "bottom",
                    legend.box = "vertical")  + geom_text(data = filter(Avg_22, Team == "New Zealand"),
                                                          aes(x = Avg_Tries_Pool, y = Team),
                                                          label = "Avg. Tries in Pool stages", fontface = "bold",
                                                          size=3,
                                                          color = "#e13d3d",
                                                          vjust = -1.8) +
  geom_text(data = filter(Avg_22, Team == "New Zealand"),
            aes(x = Avg_Tries_KO, y = Team),
            label = "Avg. Tries in KO stages", fontface = "bold",
            size=3,
            color = "#e13d3d",
            vjust = -1.8)

g2<-g + 
  geom_rect(aes(xmin=8, xmax=10, ymin=-Inf, ymax=Inf), fill="grey80") +
  geom_text(aes(label=diff, y=Team, x=9), fontface="bold", size=4) +
  geom_text(aes(x=9, y=7.7, label="Difference"),
            color="grey20", size=4, vjust=-3, fontface="bold") +
  scale_x_continuous(breaks = c(0:7.5), limits = c(-1, 10),expand = c(0, 0))   + 
  theme_ipsum()


g2

