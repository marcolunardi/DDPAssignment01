library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Mtcars dataset analysis"),
        sidebarPanel(
                sliderInput('cylnum','Number of Cylinders', value = 4, min = 4, max = 8, step = 2,),
                selectInput('trtype', 'Transmission Type', 
                             list("Manual" = "Manual", 
                               "Automatic" = "Automatic"))
        ),
        mainPanel(
                h3("App Documentation (read me first, please):"),
                p("This simple app is designed to perform a very basic exploratory analysis
                  upon the mtcars dataset included into the dataset package in R."),
                p("You can find more info about this dataset by typing 'library(dataset)' and '? mtcars' at R prompt."),
                p("When you modify the settings of engine cylinders number and transmission type,
                  the app changes the below title content, computes the mean of MPGs and weights for cars corresponding to the chosen settings,
                  and plots a graph."),
                p("The graph reports just the dataset instances corresponding to the chosen settings, so it's
                  possible to compare them with the average values drawn from the whole dataset (the two fixed orange lines
                  which split the graph in four quadrants)."),
                p("The reason why I chose to plot the MPG consumption against the weight is that the weight
                  has quite a direct influence on fuel consumption, and so it's necessary to take it into account while
                  comparing the MPGs from different cars."),
                p("For a correct evaluation, please note that a higher MPG means a lower fuel consumption (more miles with one gallon),
                  so the upper two quadrants do contain the more efficient cars."),                
                h3(textOutput("title")),
                h4("Mean MPG (Miles Per Gallon) :"),
                verbatimTextOutput("mpgmean2"),
                h4("Mean Weight (lbs/1000) :"),
                verbatimTextOutput("wtmean2"),
                plotOutput("carplot")                
        )
))