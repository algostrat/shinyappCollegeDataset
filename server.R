library(ISLR)
library(shiny)
library(ggplot2)
data("College")
attach(College)
cols = colnames(College)
cols = cols[cols !="Private"]
library(shinythemes)
library(DT)


cols
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
  titlePanel("Model Options"),
  sidebarLayout(
    sidebarPanel(
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
     # h1("regression"),
      plotOutput("plot"),
      DT::dataTableOutput("mytable",height="400px")
      
      
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