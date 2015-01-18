setwd("~/Desktop/Coursera/DDP01")

library(shiny)
library(datasets)
library(UsingR)
library(graphics)

data <- mtcars
data$am <- sub(0, "Automatic", data$am)
data$am <- sub(1, "Manual", data$am)
data$am <- as.factor(data$am)
mpgmean <- mean(data$mpg)
wtmean <- mean(data$wt)
shinyServer(function(input, output) {
        dyntitle <- reactive({
                paste("Cars with ", input$cylnum, "Cylinders and ", input$trtype, "Transmission" )
        })
        output$title <- renderText({
                dyntitle()
        })
        output$mpgmean2 <- renderText({
                sdata <- subset(data, cyl == input$cylnum)
                cars <- subset(sdata, am == input$trtype)
                mean(cars$mpg)
        })
        output$wtmean2 <- renderText({
                sdata <- subset(data, cyl == input$cylnum)
                cars <- subset(sdata, am == input$trtype)
                mean(cars$wt)
        })
        output$carplot <- renderPlot({
                sdata <- subset(data, cyl == input$cylnum)
                cars <- subset(sdata, am == input$trtype)
                plot(cars$wt, cars$mpg, col=cars$am, xlim=c(1,6), ylim=c(10,40), 
                     ylab="MPG = Miles per Gallon", xlab="Weight (lbs/1000)", cex.main=1,
                     main="MPG by Weight; Orange Lines =  mean weight and MPG for all cars",
                     pch=16, cex=3)
                abline(h = mpgmean, col="orange", lwd=4)
                abline(v = wtmean, col="orange", lwd=4)
        })
})