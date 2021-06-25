library(blogdown)
library(vroom)
library(tidyverse)
library(shiny)
library(gghighlight)
packageVersion('blogdown')
<img src="/./Blank Script_files/IMG_5890.jpg" alt="" width="400px"/>> install_hugo()
The latest Hugo version is v0.83.1
Hugo 0.83.1 has already been installed. To reinstall, use the argument force = TRUE.
> new_site(theme = "vaga/hugo-theme-m10c")
― Creating your new site
| Installing the theme vaga/hugo-theme-m10c from github.com
trying URL 'https://github.com/vaga/hugo-theme-m10c/archive/master.tar.gz'
downloaded 491 KB

| Adding the sample post to content/posts/2020-12-01-r-rmarkdown/index.Rmd
| Converting all metadata to the YAML format
| Adding netlify.toml in case you want to deploy the site to Netlify
| Adding .Rprofile to set options() for blogdown
― The new site is ready
○ To start a local preview: use blogdown::serve_site(), or the RStudio add-in "Serve Site"
○ To stop a local preview: use blogdown::stop_server(), or restart your R session
► Want to serve and preview the site now? (y/n) y
Launching the server via the command:
  /Users/joshhoward/Library/Application Support/Hugo/0.83.1/hugo server --bind 127.0.0.1 -p 4321 --themesDir themes -t hugo-theme-m10c -D -F --navigateToChanged
Serving the directory . at http://localhost:4321
Launched the hugo server in the background (process ID: 40830). To stop it, call blogdown::stop_server() or restart the R session.
Rendering content/posts/2020-12-01-r-rmarkdown/index.Rmd... Done.
> stop_server()
The web server has been stopped.
> hugo_version()
[1] ‘0.83.1’
serve_site()
Launching the server via the command:
  /Users/joshhoward/Library/Application Support/Hugo/0.83.1/hugo server --bind 127.0.0.1 -p 5118 --themesDir themes -t hugo-theme-m10c -D -F --navigateToChanged
Serving the directory . at http://localhost:5118
Launched the hugo server in the background (process ID: 42936). To stop it, call blogdown::stop_server() or restart the R session.


new_post(title="New GGplot2 graph", ext=" .Rmd", subdir="posts")
new_post(title = "Quiz (2) Final Project Topic", ext = ".Rmd", subdir = "posts")
new_post(title = "Homework (3) Day 5 plots", ext = ".Rmd", subdir = "posts")
blogdown::new_post(title = "Shiny", ext = ".Rmd", subdir = "posts")
getwd()
new_post(title = "DCS 550 HW4", ext = ".Rmd", subdir = "posts")
new_post(title = "Datasets for Final Project", ext = '.Rmd', subdir = 'posts')
new_post(title = "Final Project: ggplot2 plots, Shiny app, and Conclusion", ext = '.Rmd', subdir = 'posts')
rep(2016, 97) 
Total_Infractions <- read_csv("Total_Infractions.csv")
View(Infractions_Code_2016)

Infractions_3year <- cbind(Infractions_2016, Infractions_2017, Infractions_2018)

Years <- rep(2018,41)
Infraction_Code_2018 <- cbind(Infraction_Code_2018, Years)
Infraction_Code_2018 <- Infraction_Code_2018 %>% relocate(Years, .after = Infraction_Code)
View(Infraction_Code_2018)
Infraction_Codes_Total <- rbind(Infraction_Code_2016, Infraction_Code_2017, Infraction_Code_2018)
View(Infraction_Codes_Total)
#Infraction_Codes_Total %>% group_by(Infraction_Code) %>% summarise(sum(Occurrences)) %>%
 # ggplot() + geom_bar(aes(`sum(Occurrences)`, Infraction_Code), stat = 'identity')

Infractions_2018 <-  cbind(Infractions_2018, Year)
Infractions_2018 <- Infractions_2018 %>% relocate(Year, .after = Gender)
Infractions_2018 <- rename(Infractions_2016, Year = Year_2016)
Infractions_3year <- read_csv("Infractions_3year.csv")
Infractions_3year <- Infractions_3year %>% mutate(Year = as.factor(Year), Grade = as.factor(Grade))
View(Infractions_3year)

# Let's start by getting an overall view of the infractions for the academic school
# years of 2016-2018.

plot_5 <-  Infractions_3year %>% ggplot() +
  geom_bar(aes(Year, Infractions, fill = Year), stat = 'identity') +
  labs(title = "Total Number of Infractions by Year (2016-2018)",
       subtitle = "Grades 7th - 12th", 
       x = 'Academic Year') + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        legend.position = 'none')
Infractions_3year %>% filter(Gender == 'Female', Year == 2016 | Year == 2017 | Year == 2018) %>% ggplot() +
  geom_bar(aes(Year, Infractions), stat = 'identity')


Infractions_3year %>%
  filter(Gender == input$male | Gender == input$female, Year == 2016 | Year == 2017 | Year == 2018) %>%
  ggplot() + geom_bar(aes(Year, Infractions), stat = 'identity'))
plot_5
Infractions_3year
plot_5 + plot_6
plot_2 <- ggplot(Infractions_3year) +
  geom_bar(aes(Grade, Infractions, fill = Grade), stat = 'identity') +
  facet_wrap(~Year) + theme_dark() + labs(title = 'Infractions by grade for each academic year',
                                          x = 'Grade Level') +
  theme(plot.title = element_text(hjust = 0.5))
plot_2

# Shiny App Infractions_3year %>% group_by(Grade) %>% summarise(sum(Infractions))

plot_6 <- Infractions_3year %>% ggplot() +
  geom_bar(aes(Year, Demerits, fill = Year), stat = 'identity') +
  labs(title = "Total Number of Demerits by Year (2016-2018)",
       subtitle = "Grades 7th - 12th", 
       x = 'Academic Year') + theme_classic() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        legend.position = 'none')
plot_6
plot_3 <- ggplot(Infractions_3year) +
  geom_bar(aes(Grade, Demerits, fill = Grade), stat = 'identity') +
  facet_wrap(~Year) + theme_dark() + labs(title = 'Demerits by grade for each academic year',
                                          x = 'Grade Level') +
  theme(plot.title = element_text(hjust = 0.5))
plot_3

# Shiny App Infractions_3year %>% group_by(Grade) %>% summarise(sum(Demerits))


# Observing the data for the academic years 2016-2018 we see 2016 had many more infractions 
# among the student body as well as demerits. However, upon further inspection,
# we notice a couple of points. First, as seen in the graph below, one student 
# accounts for a little more than 12% of the total infraction count in that one year.
# No Bueno! Second, we will need to dig a bit deeper to determine the types of 
# infractions to see just how serious they might be. We'll start by 
#investigating 2016 and then see if we can identify any trends moving forward.

plot_1 <- ggplot(Infractions_2016, aes(Grade, Infractions)) +
  geom_point(data = filter(Infractions_2016, ID == 'AC006'),
             color = 'yellow', 
             size = 3) +
  geom_point(color = 'blue') + theme_dark() + 
  annotate(geom = 'text', x = 7.1, y = 83, label = "Student 'z' accounts for 12% of total
                          school infractions in 2016", hjust = 'left') +
  labs(title = '2016 Student Infractions by Grade Level',
       subtitle = '(There were 671 total infractions for this academic year',
       caption = "Student 'z' was only at the school for this academic year",
       x = 'Grade Level')
plot_1

# As we noted, one student has a large affect on the overall count, however, this 
# particular student was only enrolled for the 2016  academic school year.


ggplot(Infractions_2016, aes(Grade, Demerits)) +
  geom_count(alpha = 0.5, color = 'orange') + theme_dark() +
  scale_radius(name = 'Number of students',
               limits = c(0,10), breaks = c(1,5,7)) +
  labs(title = '2016 Student Demerits by Grade Level',
       subtitle = '(Demerits given for more serious infractions)',
       x = "Grade Level") +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

# While we do see that our 7th and 9th grade classes had the most infractions, 
# the more serious infractions resulting in demerits are found in our 10th and 
# 12th grade classes. We found that the infractions within the 7th and 9th were
# mostly related to disorderly conduct in class while those in the 10th and 12th
# were much more serious such as, fighting, bullying, and cheating. We'll deal
# in more detail with these later.


# Let's examine infractions and demerits for the 2016 academic year 
# by grade as well as gender.

plot_10 <- Infractions_3year %>% ggplot() +
  geom_bar(aes(Grade, Infractions, fill = Gender), stat = 'identity') +
  scale_fill_manual(values = c('hotpink', 'blue')) +
  theme_dark() + labs(title = ' Total Infractions by Grade and Gender',
                      subtitle = 'Ladies much more well behaved',
                      caption = '2016-2018',
                      x = 'Grade Level') +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

# Upon first glance, it appears the ladies are well behaved compared to our 
# young men in 2016, however.....
  

plot_11 <- Infractions_3year %>% ggplot() +
  geom_bar(aes(Grade, Demerits, fill = Gender), stat = 'identity') +
  scale_fill_manual(values = c('hotpink', 'blue')) +
  theme_dark() + labs(title = 'Total Demerits by Grade and Gender',
                      subtitle = 'Ladies much more well behaved???',
                      caption = '2016-2018',
                      x = 'Grade Level') +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
plot_10 + plot_11

# It seems that when the ladies did break the code of conduct, they more often 
# tend to be demerit offenses in 2016.



Infractions_3year %>% group_by(Gender) %>% summarise(sum(Demerits))
Infractions_3year %>% group_by(Gender) %>% summarise(sum(Infractions))

Infractions_3year %>% group_by(Year) %>%
  ggplot(aes(x = Infractions)) +
  geom_freqpoly(aes(color = Year), binwidth = 10)


plot_2 + plot_3




Infractions_3year %>% ggplot(aes(x = Grade, y = Demerits, fill = Gender)) +
  geom_boxplot() + 
  facet_wrap(~Year) +
  theme_dark()
Total_Infractions
Infraction_Codes_2016 <- Total_Infractions %>% filter(Year == 2016)
View(Infraction_Codes_2016)
Total_Infractions %>% ggplot() +
  geom_histogram(aes(`Infraction Code`), fill = )

Total_Infractions <- Total_Infractions[-c(20,21,22,23,24,25),]
View(Total_Infractions)

Infractions_2016 %>% filter(Grade == 8) %>% summarise(sum(Infractions))  
sum(Infractions_2016$Infractions) # 671
sum(Infractions_2017$Infractions) # 340
sum(Infractions_2018$Infractions) # 388



#ggplot(Infractions_2016, aes(Grade, Infractions)) + geom_count(alpha = 0.3, color = 'blue') +
  theme_minimal()
#####
  
  Infractions_3year %>% ggplot() +
    geom_bar(aes(Grade, Infractions, fill = Gender), stat = 'identity') +
    scale_fill_manual(values = c('hotpink', 'blue')) +
    theme_dark() + labs(title = '2016 Total Infractions by Grade and Gender',
                        subtitle = 'Ladies much more well behaved',
                        x = 'Grade Level') +
    theme(plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5)) 
  
Infractions_3year %>% filter(Gender == "Female") %>%
  ggplot(aes(Grade, Infractions, group = ID)) +
  geom_line() +
  geom_point() +
  ylim(0,40) +
  gghighlight(ID == 'TK001' | ID == 'MC007' | ID == 'DT005') +
  theme_linedraw() +
  labs(title = 'Individual Infractions by Grade Level',
       caption = '2016 - 2018',
       x = 'Grade Level')
  
Infractions_3year %>% filter(Gender == "Male") %>%
  ggplot(aes(Grade, Infractions, group = ID)) +
  geom_line() +
  geom_point() +
  ylim(0,40) +
  gghighlight(ID == 'TK001' | ID == 'MC007' | ID == 'DT005') +
  theme_linedraw() +
  labs(title = 'Individual Infractions by Grade Level',
       caption = '2016 - 2018',
       x = 'Grade Level')  
  
Infractions_3year %>% filter(Gender == "Male") %>%
  ggplot(aes(Grade, Demerits, group = ID)) +
  geom_line() +
  geom_point() +
  ylim(0,40) +
  gghighlight(ID == 'TK001' | ID == 'MC007' | ID == 'DT005') +
  theme_linedraw() +
  labs(title = 'Individual Infractions by Grade Level',
       caption = '2016 - 2018',
       x = 'Grade Level')


Infractions_3year %>% ggplot(aes(Grade, Infractions, group = ID)) +
    geom_line() +
    geom_point() +
    ylim(0,40) +
    gghighlight(ID == 'TK001' | ID == 'MC007' | ID == 'DT005') +
    theme_linedraw() +
  labs(title = 'Individual Infractions by Grade Level',
       caption = '2016 - 2018',
       x = 'Grade Level')

Infractions_3year %>% ggplot(aes(Grade, Demerits, group = ID)) +
  geom_line() +
  geom_point() +
  ylim(0,100)
  
#########

Infractions_3year %>% filter


Infractions_2016
Infractions_2016 %>% group_by(Grade) %>% summarise(sum(Infractions))
# For the year 2016, 188 infractions in 7th, 76 in 8th, 151 in 9th,
# 123 in 10th, 71 in 11th, and 62 in 12th.

grouped_infractions_by_grade <- Infractions_3year %>%
  group_by(Grade) %>% summarise(sum(Infractions))
View(grouped_infractions_by_grade)
grouped_infractions_by_grade <- rename(grouped_infractions_by_grade, Infractions = `sum(Infractions)`)

ggplot(Total_Infractions, aes(~x, y = Year)) +
  geom_count()

plot_7 <- ggplot(Infraction_Code_2016, aes(x = Infraction_Code, Occurrences)) +
  geom_bar(stat = 'identity', fill = 'orange') + coord_flip() + theme_classic() +
  scale_y_continuous(breaks = c(0,15,30,45,60,75,90,105,120,135,150)) +
  labs(title = "2016 Total Infraction Summary",
       subtitle = 'Breakdown By Infraction',
       x = 'Infraction Code',
       y = 'Number of Occurrences')

plot_7
plot_8 <- ggplot(Infraction_Code_2017, aes(x = Infraction_Code, Occurrences)) +
  geom_bar(stat = 'identity', fill = 'blue') + coord_flip() + theme_classic() +
  scale_y_continuous(breaks = c(0,15,30,45,60,75,90,105,120,135,150)) +
  labs(title = "2017 Total Infraction Summary",
       subtitle = 'Breakdown By Infraction',
       x = 'Infraction Code',
       y = 'Number of Occurrences')
plot_8

plot_9 <- ggplot(Infraction_Code_2018, aes(x = Infraction_Code, Occurrences)) +
  geom_bar(stat = 'identity', fill = 'green') + coord_flip() + theme_classic() + 
  scale_y_continuous(breaks = c(0,15,30,45,60,75,90,105,120,135,150)) +
  labs(title = "2018 Total Infraction Summary",
       subtitle = 'Breakdown By Infraction',
       x = 'Infraction Code',
       y = 'Number of Occurrences')

plot_9

Infraction_Code_2016 <- Infraction_Code_2016 %>% mutate(Infraction_Code = as.factor(Infraction_Code))
Infraction_Code_2016 <- select(Infraction_Code_2016, -c(X3:X22))
Infraction_Code_2016
Infraction_Code_2018 <- Infraction_Code_2018 %>% mutate(Infraction_Code = as.factor(Infraction_Code))
Infraction_Code_2018 <- rename(Infraction_Code_2018, Occurrences = Count)
Infraction_Code_2018 <- select(Infraction_Code_2018, -c(X3:X20))
Infraction_Code_2018 <- Infraction_Code_2018[-c(20,21,22,23,24,25,26,27),]
View(Infraction_Code_2018)
