# tidyverse-ggplot2

Code for all the ggplot2 analyses done and published.






### **Bar chart**

Ggplot2 chart using geom_bar 

      
      g<- ggplot(empeorers3, aes(x=reorder(dynasty,average), y=average)) +
        geom_bar(stat="identity", fill="#69b3a2", width=0.6) +
        coord_flip() +

        theme_ipsum()
          ... #Please see "Two geom_bar graphs - TidyTuesday 13-8-2019.R" for full code
       
 
 <br>
 
 <p align="center">
  <img width="918" alt="13 8 2019" src="https://user-images.githubusercontent.com/37122520/63228728-1a0e4c80-c1ef-11e9-9905-969e62706e73.png">
</p>



### **Dumbbell**


Ggplot2 chart using geom_dumbbell.

      ggplot(Electric_car, aes(x = avg_city_consumption, xend = avg_highway_consumption, 
                              y=reorder(make,avg_city_consumption))) + 
        geom_dumbbell(colour = "#e5e5e5",
                      size = 3,
                      colour_x = "#228b34",
                      colour_xend = "#1380A1")+
        theme_ipsum_rc()  + ....
        
<br>  

<p align="center">
<img width="918" alt="14 10 2019" src="https://user-images.githubusercontent.com/37122520/67159242-050e8080-f33a-11e9-954d-8836ba2e1a77.png">
</p>


<br>

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
  
 <br>
 
<p align="center">
<img width="918" alt="Exports - 15 8 2019" src="https://user-images.githubusercontent.com/37122520/63228732-2397b480-c1ef-11e9-847b-e6947ed369eb.png">
</p>

<br>


<br>

Multi-point “dumbbell” plot with ggplot2 and point difference.

      ggplot(Avg_223, aes(x = Avg_Tries_Pool, xend = Avg_Tries_KO, y=reorder(Team,Avg_Tries_Pool))) + 
        geom_dumbbell(colour = "#dddddd",
                      size = 3,
                      colour_x = "#FAAB18",
                      colour_xend = "#1380A1") + ... 
        geom_rect(aes(xmin=8, xmax=10, ymin=-Inf, ymax=Inf), fill="grey80") +
        geom_text(aes(label=diff, y=Team, x=9), fontface="bold", size=4) +
        geom_text(aes(x=9, y=7.7, label="Difference"),
                  color="grey20", size=4, vjust=-3, fontface="bold") +
        scale_x_continuous(breaks = c(0:7.5), limits = c(-1, 10),expand = c(0, 0))   + 
        theme_ipsum()  # Please see "Multi-point dumbbell with difference - Rugby World Cup 2019" for full code
        

<br>
<p align="center">
<img width="918" alt="Rugby (2)" src="https://user-images.githubusercontent.com/37122520/68074483-58012280-fd93-11e9-98af-7f41d4cb5a19.png">
</p>
<br>



### **Ridgeline**


      ggplot(Life_Expectancy_Gender_gather_join_2016, aes(x=Life_Expectancy,
                                                            y = reorder(Continent,desc(Continent)), 
            fill = Gender, group  = interaction(Continent, Gender)),width=800, height=700) +
        geom_density_ridges() + 
        theme_ipsum_rc()+
        labs(

          caption = "\n Source:World Bank  | https://data.worldbank.org/
            Visualization: JuanmaMN (Twitter @Juanma_MN)",
          x = "Life Expectancy",
          y = "")  #Please see "Life Expectancy - Flexdashboard.Rmd" for full code
<br> 

<p align="center">
<img width="918" alt="Ridgeline - Graph - Gender" src="https://user-images.githubusercontent.com/37122520/63228668-10d0b000-c1ee-11e9-80e8-8b11d9a0d4f2.png">
</p>

<br>

### **Area graph**

      p23 <- Children_out_of_school_3%>% 
        ggplot(aes(x=Year, y=Value, group=1,
                   text = paste("Gender:", Gender, 
                                "<br> Children out of school primary:", round(Value/1000000, digits = 1),
                                                                                          "million"),
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
          y = "")

      ggplotly(p23, tooltip=c("x","text"))

 <br>
<p align="center">
<img width="918" alt="Gender analysis" src="https://user-images.githubusercontent.com/37122520/66345225-8aac2c80-e947-11e9-9784-012d61ce8fb1.png">
</p>


<br>

### **Waffle graph**


      ggplot(waffle, aes(fill = Review_Rating, values = n)) +

            geom_waffle(color = "white", size = .25, n_rows = 10, flip = T) +

            facet_wrap(~Year, nrow = 1, strip.position = "bottom") + ... 
      
                  #Please see "geom_waffle - TidyTuesday 22-10-2019.R" for full code


<br>
 
<p align="center">
<img width="918" alt="waffle" src="https://user-images.githubusercontent.com/37122520/68069095-a989bd00-fd53-11e9-8823-8d2e7ca05487.png">


</p>
