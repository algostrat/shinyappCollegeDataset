library(ISLR)
library(shiny)
library(ggplot2)
library(shinythemes)
library(DT)
source("global.R")

server <- function(input, output) {

 output$plot <- renderPlot({
   
   reg = input$regressor
   reg = dictr[[reg]]
   pred = input$predictor
   pred = dictr[[pred]]
   
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
      
    } else if(input$privatesplit == TRUE){
    
       g = ggplot(College, aes_string(x=pred, y=reg, 
                            group = College$Private,
                            color = College$Private)) + 
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
