
library(shiny)
require(caret) 
library(ggplot2)
data("iris")
shinyServer(function(input, output,session) {
        # Prepare the data
        set.seed(1)
        train_ind <- sample(1:nrow(iris), 0.7*nrow(iris))

        train_features<- iris[train_ind,1:4]
        test_features<- iris[-train_ind,1:4]
        train_labels<- iris[train_ind, 5]
        test_labels <- iris[-train_ind, 5]
        # train the modle
        fitControl = trainControl(method="none")
        knnGrid = reactive({expand.grid(k = input$k)})
        knnFit = reactive ({train(x= train_features, y = train_labels,
                                 method = "knn", 
                                 metric = "Accuracy",
                                 tuneGrid = knnGrid,
                                 trControl = fitControl)
                           })
        # predictions
        knnPredict <- reactive({predict(knnFit, newdata = test_features)})
        # plot the result
        selectedData <- reactive({
                iris[-train_ind, c(input$xcol, input$ycol)]
        })
        
        output$plot1 <- renderPlot({
#                 par(mar = c(5.1, 4.1, 0, 1))
                plot(selectedData(),
                     col = knnPredict(),
                     pch = 20, cex = 3)
                
                
        })
                
        
        
        
        

})
