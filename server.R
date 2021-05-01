source("global.R")
library(ISLR)
library(shiny)
library(ggplot2)
library(shinythemes)
library(DT)

data("College")
cols = colnames(College)
cols = cols[cols !="Private"]

names = c("Applications recieved","Applications accepted", "Number of new enrollees", "Number of top 10% students",
          "Number of top 25% students", "Fulltime undergrads", "Partime undergrads", "Out of state tuition",
          "Room and Board costs", "Book costs", "Estimated personal expenditure", "% of Phd faculty",
          "% of faculty with terminal degree", "Student/faculty ratio", "% of alumni who donate",
          "Total instructional expenditure","Graduation rate")
dict = setNames(as.list(names), cols)
dictr = dict = setNames(as.list(cols), names)
#dictr$`Applications recieved`
#dictr["Apps"]
#dict[["Apps"]]

ui <- fluidPage(
  #shinythemes::themeSelector(),
  theme = shinytheme('united'),
  navbarPage("Explore linear relationships in college data")
  ,
  titlePanel("U.S. News and World Report's College Data"),
  sidebarLayout(
    sidebarPanel(
      h3("Model Options"),
      selectInput(inputId = "regressor", "Select regressor",
                  names,selected = "Out of state tuition"),
      selectInput(inputId = "predictor", "Select predictor",
                  names, selected = "Number of top 10% students"),
      selectInput(inputId = "linetype", "Choose fit", c('smooth','linear')),
      checkboxInput("privatesplit", "Group by private/public")
      #,  
      #tags$head(
      #  tags$style(type="text/css", "select { max-width: 300px; }"),
      #  tags$style(type="text/css", ".span4 { max-width: 300px; }"),
      #  tags$style(type="text/css", ".well { max-width: 280px; }")
      #)
    ),
    mainPanel(
      h3("Regression plot"),
      plotOutput("plot"),
      plotOutput("residualDiagnostics"),
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

server <- function(input, output) {

 output$plot <- renderPlot({
   
   reg = input$regressor
   reg = dict[[reg]]
   pred = input$predictor
   pred = dict[[pred]]
   
    if(input$linetype == 'smooth'){
       method = 'loess'
     } else {
       method='lm'
     }
    if(input$privatesplit == FALSE){
      
      g = ggplot(College, aes_string(x=pred, y=reg)) + 
        geom_point(position= 'jitter', alpha=0.5) +
        stat_smooth(method=method) + 
        xlab(input$predictor) + ylab(input$regressor) +
      theme_minimal(  base_size = 15) 
      
    } 
   if(input$privatesplit == TRUE){
    
       g = ggplot(College, aes_string(x=pred, y=reg, 
                            group = Private,
                            color = Private)) + 
        geom_point(position= 'jitter', alpha=0.5) + 
        geom_smooth(method=method) +
         xlab(input$predictor) + ylab(input$regressor) +
         scale_color_manual(values=c("darkorange1", "blue4")) + 
         theme_minimal( base_size = 15) +
        theme(legend.position="top")  + labs(color='Private')
        
    }
   g
  })
 
 output$mytable = DT::renderDataTable({
   datatable(College, extensions = 'FixedColumns', rownames = TRUE,
             options = list(bPaginate = FALSE, searching = TRUE, info = FALSE,
                            dom = 't',
                            scrollX = TRUE,
                            fixedColumns = TRUE),
             fillContainer = TRUE) })
  
}

shinyApp(ui = ui, server = server)