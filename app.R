#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plyr)
library(dplyr)
library(datasets)

#datasets über dataset package
#skatterplot über R Shiny webpage - gallery movie explorer


ui = fluidPage(
  sidebarLayout(
    sidebarPanel(
      actionButton("newplot", "New plot"),
      sliderInput(inputId = "noise_sd","Noise SD:",
                  min=0.1,max=10,value=1,step = .1)
      
    )
    ,
    mainPanel(plotOutput("plot")
    ))
)


server = function(input, output) {
  
  output$plot_tab2 <- renderPlot({ 
    polynomial_regression_plot <- plot(1:3)
    
    
    plot(polynomial_regression_plot)
  })
  
  output$plot <- renderPlot({
    #input$newplot
    noise_sd = input$noise_sd
    # Add a little noise to the cars data
    #cars2 <- cars + rnorm(nrow(cars))
    n <- 100
    x <- rnorm(n, 0, 1)
    y <- 100 + 0.5*x + rnorm(n, 0, noise_sd)
    simulated_data <- data.frame(x, y)
    
    plot(simulated_data$x, simulated_data$y)
    
  })
}



shinyApp(ui = ui, server = server)

