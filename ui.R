

library(shiny)

shinyUI(fluidPage(
        titlePanel("Iris knn classification"),
        
        fluidRow(
                column(6,
                       p("This app takes the iris data, split it into trainning
                          and test data, we use all the features to buid the model.
                         Here the X variable and Y variable are variables used to 
                         visualize the result, the 'number of neibours' is the parameter
                         k in knn model. The main popurse of this app is to study 
                         the effect of parameter k to the prediction"
                         ))
        ),
        
        fluidRow(
                column(12,
                       sidebarPanel(
                               selectInput('xcol', 'X Variable', names(iris)),
                               selectInput('ycol', 'Y Variable', names(iris),
                                           selected=names(iris)[[2]]),
                               numericInput('k', 'Number of neighbours', 5,
                                            min = 1, max = 10)
                       ))
        ),
        
        
        fluidRow(
                column(6,
                       mainPanel(plotOutput('plot1'))
                )
                
        )
        
        )
        
        
        
)