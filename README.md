# tidyverse-ggplot2

Code for all the ggplot2 analyses done and published.






## **Bar chart**


**Ggplot2 chart using geom_bar** - Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_bar/Two%20geom_bar%20graphs%20-%20TidyTuesday%2013-8-2019.R)

<br> 




      
      g<- ggplot(empeorers3, aes(x=reorder(dynasty,average), y=average)) +
        geom_bar(stat="identity", fill="#69b3a2", width=0.6) +
        coord_flip() +
        theme_ipsum()  ...
       
 
 <br>
 
 <p align="center">
  <img width="918" alt="13 8 2019" src="https://user-images.githubusercontent.com/37122520/63228728-1a0e4c80-c1ef-11e9-9905-969e62706e73.png">
</p>

<br>



**Ggplot chart using geom_bar** - Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_bar/geom_bar%20-%20TidyTuesday%203-3-2020.R)

      graph<-ggplot(data_lift3,aes(season, increase, fill=color)) +
        geom_bar(stat = "identity")  ...

 
 <br>
 
 <p align="center">
      
 <img width="918" alt="13 8 2019" src="https://user-images.githubusercontent.com/37122520/80753894-f9d8b080-8b25-11ea-9ce1-94caf889157b.png">
</p>

<br>




## **geom_bar - facet_wrap**



**Ggplot2 chart using geom_bar and facet_wrap** - Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_bar/geom_bar%20-%20facet_wrap%20-%20TidyTuesday%2014-1-2020.R)

      g13<-passwords3%>% ggplot( aes(x=category, y=value)) +
        geom_bar(stat="identity", fill="#69b3a2", width=0.6) + ...
          facet_wrap(~measure, ncol=4) + ... 
          
 <br>
 
 <p align="center">  
<img width="918" alt="14-1-2020" src="https://user-images.githubusercontent.com/37122520/72380110-a3796a80-370c-11ea-8eb6-2351f97d843c.png">
</p>

<br>



## **Dumbbell**


**Ggplot2 chart using geom_dumbbell.** - Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_dumbbell/geom_dumbbell%20-%20TidyTuesday%2014-10-2019.R)

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

**Multi-point “dumbbell” plot with ggplot2.** - Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_dumbbell/Multi-point%20%E2%80%9Cdumbbell%E2%80%9D%20Plots%20in%20ggplot2.R)

     ggplot() +
 
        geom_segment(
          data = gather(Exports2, measure, val, -Country) %>% 
            group_by(Country) %>% 
            top_n(-1) %>% 
            slice(1) %>%
            ungroup(),
          aes(x = 0, xend = val, y = Country, yend = Country),
          linetype = "blank", size = 0.3, color = "gray80"
        ) +   ...
  
 <br>
 
<p align="center">
<img width="918" alt="Exports - 15 8 2019" src="https://user-images.githubusercontent.com/37122520/63228732-2397b480-c1ef-11e9-847b-e6947ed369eb.png">
</p>

<br>


<br>

**Multi-point “dumbbell” plot with ggplot2 and point difference.** - Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_dumbbell/Multi-point%20dumbbell%20with%20difference%20-%20Rugby%20World%20Cup%202019%20-%202-11-2019.R)

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
        theme_ipsum()  ...
        

<br>
<p align="center">
<img width="918" alt="Rugby (2)" src="https://user-images.githubusercontent.com/37122520/68074483-58012280-fd93-11e9-98af-7f41d4cb5a19.png">
</p>
<br>



## **Ridgeline**


Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_density_ridges/Life%20Expectancy%2012.7.2019/Life%20Expectancy%20-%20Two%20plots.R)

      ggplot(Life_Expectancy_Gender_gather_join_2016, aes(x=Life_Expectancy,
                                                            y = reorder(Continent,desc(Continent)), 
            fill = Gender, group  = interaction(Continent, Gender)),width=800, height=700) +
        geom_density_ridges() + 
        theme_ipsum_rc()+
        labs(

          caption = "\n Source:World Bank  | https://data.worldbank.org/
            Visualization: JuanmaMN (Twitter @Juanma_MN)",
          x = "Life Expectancy",
          y = "")  ...

<br> 

<p align="center">
<img width="918" alt="LE" src="https://user-images.githubusercontent.com/37122520/68077357-3e270600-fdba-11e9-8fb6-34d200a6e855.png">
</p>

<br>


## **Area graph**


Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_area/geom_area%20-%20Education%20analysis%20by%20Gender.R)

<br>

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

## **Waffle graph**


Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_waffle/geom_waffle%20-%20TidyTuesday%2022-10-2019.R)
<br>

      ggplot(waffle, aes(fill = Review_Rating, values = n)) +

            geom_waffle(color = "white", size = .25, n_rows = 10, flip = T) +

            facet_wrap(~Year, nrow = 1, strip.position = "bottom") + ... 
      


<br>
 
<p align="center">
<img width="918" alt="waffle" src="https://user-images.githubusercontent.com/37122520/68069095-a989bd00-fd53-11e9-8823-8d2e7ca05487.png">


</p>


## **Heatmap with geom_tile**

Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_tile/geom_tile%20-%20TidyTuesday%2018-11-2019.R)

<br>
      ggplot(data, aes(x = Day, y = fct_reorder(bird_breed,n))) +
        geom_tile(aes(fill = n), color = "#2b2b2b") +
        geom_text(aes(label = n), color = "#22292F") +
        scale_fill_gradient(low = "#20b2aa", high = "#2072b2") + ...
        

<br>

<p align="center">
<img width="918" alt="data" src="https://user-images.githubusercontent.com/37122520/69096394-3f0f9700-0a4c-11ea-9761-fb9402ca2af8.png">
</p>


## **Animated ggplot with gganimate**

Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/gganimate/gganimate%20-%20GNI%20-%20Github.R)

<br>

      ggplot<-data %>% ggplot(aes(x=rank, y=GNI,group = Country)) +
        geom_bar(stat="identity", aes(fill = Country %in% c("Sub-Saharan Africa",...)), width=0.6) +
        scale_fill_manual(values=c("#5f7ea0","#5f9ea0"))+
        coord_flip(clip = "off", expand = FALSE) +
        theme_ipsum() +
        #transition_reveal(Year) +
        transition_states(Year, transition_length = 3, state_length = 1) + ...
            
      


<br>

<p align="center">
<img width="918" alt="data" src="https://user-images.githubusercontent.com/37122520/70080199-0819b380-15fe-11ea-835d-b5cfc5418430.gif">
</p>

 ## **geom_bar_text**

Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_bar_text/geom_bar_text%20%20-%20TidyTuesday%207-1-2020.R)

<br>

      pAustralia <- temperatureperth2 %>% 
        ggplot(aes(date, diff, label = diff, fill = diff)) +
        scale_fill_gradient(low = "#20b2aa", high = "#2072b2") +
        geom_col() +
        geom_bar_text(place = "right", contrast = TRUE, size=10) +  ...
  
<br>

<p align="center">
<img width="918" alt="data" src="https://user-images.githubusercontent.com/37122520/71928433-774f6e00-318f-11ea-9188-ab6772e93047.png">
</p>


## **geom_bar_text  + geom_flag**

Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_bar_text/geom_bar_text%20-%20geom_flag%20-%2013-1-2020.R)

<br>
            ggplothp<-data_2019 %>% ggplot(aes(x=fct_reorder(Country,Happiness_Score), y=Happiness_Score,
              group = Country, fill= factor(Country))) +
              geom_col(width = 0.8) +
              geom_bar_text(place = "right", contrast = TRUE, size=10,
                            aes(label=paste0(Country, "  ",round(Happiness_Score,3)))) + ...
                            
    
<br>

<p align="center">
<img width="918" alt="HP" src="https://user-images.githubusercontent.com/37122520/72283288-5c20aa80-3636-11ea-8e27-49fffb648d46.png">
</p>

<br>

## **geom_chicklet**

Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_chicklet/geom_chicklet%20-%20TidyTuesday%2010-2-2020.R)

<br>
            plot_hotel<-ggplot(hotels_data, aes(x = arrival_date_month, y = prop, fill = hotel)) +
              geom_chicklet() +
              coord_flip() +
              theme_minimal() +
              scale_fill_manual(values = c("#add8e6", "#20b2aa"))  + ...

          
 <br>

<p align="center">
<img width="805" alt="10-2-2020" src="https://user-images.githubusercontent.com/37122520/74194722-c0448780-4c51-11ea-93db-a7bd4162025f.png">
</p>

<br>


## **geom_bump**

Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_bump/geom_bump%20-%201-3-2020.R)

<br>
            ggplot(data3, aes(Year, rank, color = Country)) +
              geom_point(size = 7) +
              geom_text(data = data3 %>% filter(Year == min(Year)),
                        aes(x = Year - .1, label = Country), size = 4, hjust = 1) +
              geom_text(data = data3 %>% filter(Year == max(Year)),
                        aes(x = Year + .1, label = Country), size = 4, hjust = 0) +
              geom_bump(aes(smooth = 6), size = 1.5)  + ...
              
 
              
              
              
<br>

<p align="center">
<img width="805" alt="geom_bump" src="https://user-images.githubusercontent.com/37122520/75709176-10939000-5cba-11ea-81e0-94159ff96991.png">
</p>

<br>


## **Line chart**

Code is available [here](https://github.com/JuanmaMN/tidyverse-ggplot2/blob/master/geom_line/geom_line%20-%20TidyTuesday%20-%2027-4-2020.R)

            g2<-grosses2 %>%
              ggplot(aes(month,total_seats_sold, group=year, col=factor(year))) +
              geom_line(size=1.5,linetype = "solid") + 
              geom_point(size=4, shape=21, fill="#f0f0f0") ... 

            
              
              
<br>

<p align="center">
<img width="805" alt="line_chart" src="https://user-images.githubusercontent.com/37122520/80753924-0bba5380-8b26-11ea-9048-24d21101077a.png">
      
<br>


## **Map**    

        p<-plot_usmap(data = data2, values = "value", labels = TRUE, lines = "white", 
                                                      label_color = "white") ...
            
             # Please see "plot_usmap - TidyTuesday 30-3-2020" for full code
             
             
<br>

<p align="center">
<img width="805" alt="map_c" src="https://user-images.githubusercontent.com/37122520/80753936-1248cb00-8b26-11ea-8dbd-d39fef5730df.jpg">
</p>
<br>
    
      
      
          europe2 <- europe + geom_polygon(data = map,
                                 aes(fill = fine,x = long,
                                     y = lat, group = group),
                                 color = "grey70")  ...
               
             # Please see "geom_polygon - TidyTuesday - 20-4-2020" for full code


<br>
<p align="center">
<img width="805" alt="map_d" src="https://user-images.githubusercontent.com/37122520/80753913-01985500-8b26-11ea-959d-dc7e5d88756f.png">
</p>

<br>

            pA <- ggplot() + 
              geom_map(data = world, map = world,
                       aes(long, lat, group = group,  map_id = region),
                       fill = "#282828", color = "#282828") +
              geom_map(data = databerup, map = world,
                       aes(fill = total, map_id = country),
                       color = "#282828", size = 0.15, alpha = .8) ... 
                       
            # Please see "geom_map - TidyTuesday 11-5-2020.R" for full code

<br>
<p align="center">
<img width="805" alt="map_d" src= "https://user-images.githubusercontent.com/37122520/86510376-0360ec00-bde7-11ea-850e-18abfec2ddd2.png">
</p>
<br>

### **Donut chart**  


<br>

           gender_donut_second<-ggplot(individuals_study_site2, aes(ymax=yaxismax, ymin=yaxismin, 
                                                                        xmax=4, xmin=3, fill=study_site2)) +
              geom_rect(show.legend=T, alpha=0.5) + 
              coord_polar(theta="y")  ...
              
             # Please see "geom_rect - TidyTuesday 23-6-2020.R" for full code
     
   
<br>
<p align="center">
  
<img width="805" alt="23-6-2020 - 2" src="https://user-images.githubusercontent.com/37122520/86510553-92223880-bde8-11ea-99da-8225bdb8ee28.png">
</p>
<br>


            patchworkgdatafirsts5<-cowplot::plot_grid(gdatafirsts4, gender_datafirsts2, ncol = 2,
                                                      align = "v")  ...
              
              # Please see "patchwork - TidyTuesday - 8-6-2020.R" for full code
              
<br>              
<p align="center">
  
<img width="805" alt="23-6-2020 - 2" src="https://user-images.githubusercontent.com/37122520/86510386-1673bc00-bde7-11ea-9a03-5cb7a7d87904.png">
</p>
<br>

  
            
              
