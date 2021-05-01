library(ISLR)
library(shiny)
library(ggplot2)
library(shinythemes)
library(DT)
source("global.R")

ui <- fluidPage(
  #shinythemes::themeSelector(),
  theme = shinytheme('united'),
  navbarPage("U.S. News and World Report's College Data"),
  titlePanel("Explore linear relationships in college data"),
  br(),
  sidebarLayout(
    sidebarPanel(
      h3("Model Options"),
      selectInput(inputId = "regressor", "Select regressor",
                  names,selected = "Out of state tuition"),
      selectInput(inputId = "predictor", "Select predictor",
                  names, selected = "Number of top 10% students"),
      selectInput(inputId = "linetype", "Choose fit", c('smooth','linear')),
      checkboxInput("privatesplit", "Group by private/public")
    ),
    mainPanel(
      h3("Regression plot"),
      plotOutput("plot"),
      h3("Full dataset"),
      DT::dataTableOutput("mytable",height="400px"),
      h3("Variables"),
      HTML("<ul>
           <li>Private = A factor with levels No and Yes indicating private or public university</li>
           <li>Apps = Number of applications received</li>
           <li>Accept = Number of applications accepted</li>
           <li>Enroll = Number of new students enrolled</li>
           <li>Top10perc = Pct. new students from top 10% of H.S. class</li>
           <li>Top25perc = Pct. new students from top 25% of H.S. class</li>
           <li>F.Undergrad = Number of fulltime undergraduates</li>
           <li>P.Undergrad = Number of parttime undergraduates</li>
           <li>Outstate = Out-of-state tuition</li>
           <li>Room.Board = Room and board costs</li>
           <li>Books = Estimated book costs</li>
           <li>Personal = Estimated personal spending</li>
           <li>PhD = Pct. of faculty with Ph.D.'s</li>
             <li>Terminal = Pct. of faculty with terminal degree</li>
             <li>S.F.Ratio = Student/faculty ratio</li>
             <li>perc.alumni = Pct. alumni who donate</li>
             <li>Expend = Instructional expenditure per student</li>
             <li>Grad.Rate = Graduation rate</li>
           </ul>"),
      h3("Source"),
      p("This dataset was taken from the StatLib library which is maintained
        at Carnegie Mellon University. The dataset was used in the ASA 
        Statistical Graphics Section's 1995 Data Analysis Exposition."),
      h3("Additional information"),
      tags$a(href="https://github.com/algostrat/shinyappCollegeDataset", "Github project repository,"),
      tags$a(href="https://www.statlearning.com/", "StatLearning.com,"),
      tags$a(href="https://rdrr.io/cran/ISLR/man/College.html", "rdrr.io/cran/ISLR/man/College.html"),
      
      h3("References"),
      p("James, G., Witten, D., Hastie, T., and Tibshirani, R. 
        (2013) An Introduction to Statistical Learning with applications in R")

      )
    )
  )
