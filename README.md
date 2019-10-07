# tidyverse-ggplot2

Code for all the ggplot2 analysis done and published.






### **Bar chart**

Ggplot2 chart using geom_bar 

      
      g<- ggplot(empeorers3, aes(x=reorder(dynasty,average), y=average)) +
        geom_bar(stat="identity", fill="#69b3a2", width=0.6) +
        coord_flip() +

        theme_ipsum()
          ... #Please see "Two geom_bar graphs - TidyTuesday 13-8-2019.R" for full code
       
  
<img width="918" alt="13 8 2019" src="https://user-images.githubusercontent.com/37122520/63228728-1a0e4c80-c1ef-11e9-9905-969e62706e73.png">


### **Dumbbell**

Multi-point “dumbbell” plot with ggplot2.  

     ggplot() +
 
        geom_segment(
          data = gather(Exports2, measure, val, -Country) %>% 
            group_by(Country) %>% 
            top_n(-1) %>% 
            slice(1) %>%
            ungroup(),
          aes(x = 0, xend = val, y = Country, yend = Country),
          linetype = "blank", size = 0.3, color = "gray80"
        ) +   #Please see "Multi-point “dumbbell” Plots in ggplot2.R" for full code
  

<img width="681" alt="Exports - 15 8 2019" src="https://user-images.githubusercontent.com/37122520/63228732-2397b480-c1ef-11e9-847b-e6947ed369eb.png">


### **Ridgeline**


      ggplot(Life_Expectancy_Gender_gather_join_2016, aes(x=Life_Expectancy,y = reorder(Continent,desc(Continent)), 
            fill = Gender, group  = interaction(Continent, Gender)),width=800, height=700) +
        geom_density_ridges() + 
        theme_ipsum_rc()+
        labs(

          caption = "\n Source:World Bank  | https://data.worldbank.org/
            Visualization: JuanmaMN (Twitter @Juanma_MN)",
          x = "Life Expectancy",
          y = "")  #Please see "Life Expectancy - Flexdashboard.Rmd" for full code
    
<img width="686" alt="Ridgeline - Graph - Gender" src="https://user-images.githubusercontent.com/37122520/63228668-10d0b000-c1ee-11e9-80e8-8b11d9a0d4f2.png">


### **Area graph**

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

