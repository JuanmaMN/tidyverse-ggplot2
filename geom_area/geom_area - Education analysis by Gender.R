# Upload the data ---------------------------------------------------------

library(readxl)
Out_of_school <- read_excel("Out_of_school.xls")
# #View(Out_of_school)
colnames(Out_of_school)
names(Out_of_school)[2]<- "Indicator"

unique(Out_of_school$Indicator)


# Packages ----------------------------------------------------------------


library(viridis)
library(hrbrthemes)
library(plotly)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(ggridges)
library(hrbrthemes)
library(scales)





# Male data ---------------------------------------------------------------

library(tidyverse)
Male<-Out_of_school %>% filter(Indicator =="Children out of school, primary, male")
# #View(Male)


Male_gather<-gather(Male, Year, Children_out_of_school_male, '1970':'2018')
#View(Male_gather)

Children_out_of_school_gender_Male<-Male_gather%>%select(1:4)%>%na.omit()


#View(Children_out_of_school_gender_Male)

names(Children_out_of_school_gender_Male)[1]<-"Country"
names(Children_out_of_school_gender_Male)[4]<-"Male"

# Female data -------------------------------------------------------------



library(tidyverse)
Female<-Out_of_school %>% filter(Indicator =="Children out of school, primary, female")
# #View(Female)


Female_gather<-gather(Female, Year, Children_out_of_school_female, '1970':'2018')
#View(Female_gather)

Children_out_of_school_gender_Female<-Female_gather%>%select(1:4)%>%na.omit()


# #View(Children_out_of_school_gender_Female)

names(Children_out_of_school_gender_Female)[1]<-"Country"
names(Children_out_of_school_gender_Female)[4]<-"Female"



# Join --------------------------------------------------------------------

Children_out_of_school2<-Children_out_of_school_gender_Male%>%inner_join(Children_out_of_school_gender_Female, by=c("Country", "Year")) %>%
  select(1,3,4,6)


# #View(Children_out_of_school2)


Children_out_of_school_2<-Children_out_of_school2%>%
  filter (Year %in% c(2000:2018) & Country == "World") %>%
  gather(Gender, Value, 3:4) 








Children_out_of_school_3<-Children_out_of_school2%>%
  filter (Year %in% c(1970:2018) & Country == "World") %>%
  gather(Gender, Value, 3:4) 

#View(Children_out_of_school_3)



Children_out_of_school_3$Value<-as.numeric(Children_out_of_school_3$Value)

p23 <- Children_out_of_school_3%>% 
  ggplot(aes(x=Year, y=Value, group=1,
             text = paste("Gender:", Gender, 
                          "<br> Children out of school primary:", round(Value/1000000, digits = 1), "million"),
             fill=Gender)) +
  geom_area() +
  geom_hline(yintercept=59100000, linetype="dashed", color = "red") +
  scale_fill_viridis(discrete = TRUE)  +
  theme_ipsum() +
  theme(legend.position="bottom")  +
  scale_y_continuous(label = unit_format(unit = "m", scale = 1e-6))+
  scale_x_discrete(breaks=c(1970,1980,1990,2000, 2010, 2018))+
  labs(
    title = "Children out of school (primary) - World Analysis - Yearly trends by Gender",
    x = "",
    y = "") +
  scale_fill_brewer(palette="Dark2") 

ggplotly(p23, tooltip=c("x","text"))

