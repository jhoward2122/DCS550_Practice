#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Shiny App Infractions_3year %>% group_by(Grade) %>% summarise(sum(Infractions))


library(shiny)
library(readr)
library(tidyverse)
library(gghighlight)
library(blogdown)
library(vroom)
Infractions_3year <- read_csv("Infractions_3year.csv")
Infractions_3year <- Infractions_3year %>% mutate(Year = as.factor(Year), Grade = as.factor(Grade))





ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = 'darkly'),
  tabsetPanel(
    tabPanel("Infractions by Gender",
             titlePanel("Infractions by Gender for each Year"),
             sidebarLayout(
               sidebarPanel(
                 radioButtons('sex', 'Gender', choices = c('Male', 'Female')
                              )
               ),
               mainPanel(
                 plotOutput('bar')
            )
        )
    ),
    tabPanel("Total Infractions by Student",
             titlePanel("Infractions and Demerits by Student (2016-2018)"),
             dataTableOutput("dynamic")
    ),
    tabPanel("Type of Infraction",
             titlePanel("Summary of Infraction Type by Year"),
             sidebarLayout(
               sidebarPanel(
                 radioButtons('year', "Years", choices = c(2016, 2017, 2018))
               ),
               mainPanel(plotOutput('barcount'))
             )
    ),
    tabPanel("Yearly Changes by Student",
             titlePanel("Yearly Changes in Student Infractions"),
             sidebarLayout(
               sidebarPanel(
                 radioButtons('s', 'Gender', choices = c('Male', 'Female'))
               ),
               mainPanel(plotOutput('line'))
               
             )
    ),
    tabPanel("Individual Student Highlight",
                titlePanel("Highlighting Individual Student Changes"),
                sidebarLayout(
                  sidebarPanel(
                    selectInput('student', "Select Student ID", Infractions_3year$ID)
                  ),
                  mainPanel(plotOutput('linegraph'))
                )
    )
  )
)  
  


server <- function(input, output, session) {
  output$bar <- renderPlot(
    Infractions_3year %>%
      filter(Gender == input$sex) %>%
      ggplot() + geom_bar(aes(Year, Infractions, fill = Year), stat = 'identity'))
  output$dynamic <- renderDataTable(Infractions_3year, options = list(pageLength = 10))
  output$barcount <- renderPlot(
    Infraction_Codes_Total %>% filter(Years == input$year) %>%
      group_by(Infraction_Code) %>% summarise(sum(Occurrences)) %>%
      ggplot() + geom_bar(aes(`sum(Occurrences)`, Infraction_Code), fill = 'black', color = 'red', stat = 'identity') +
      theme_dark() + labs(x = "Total Occurrences", y = 'Infraction Code'))
  output$line <- renderPlot(
    Infractions_3year %>% filter(Gender == input$s) %>%
      ggplot(aes(Grade, Infractions, group = ID)) +
      geom_line() +
      geom_point() +
      ylim(0,40) + labs(caption = '2016 - 2018'))
  output$linegraph <- renderPlot(
    Infractions_3year %>% filter(ID == input$student) %>%
      ggplot(aes(Grade, Infractions, group = ID)) +
      geom_line(color = 'blue') +
      geom_point(color = 'white') +
      ylim(0,40) + theme_dark()
  )
  
  

}

shinyApp(ui, server)




    



