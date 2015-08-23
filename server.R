# install.packages("devtools")
# install.packages("Rtools")
# install.packages("shiny")
# install.packages("UsingR")

library(devtools)
# library(Rtools)
library(shiny)
library(UsingR)
data(galton)
predict1 <- lm(child ~ parent, data=galton)
sfactor <- function(x) ifelse(x=="Male", c(1, 1.08), c(1.08,1))

shinyServer(
function(input, output) {
  output$omh <- renderPrint(input$myHeight)
  output$oyh <- renderPrint(input$spouseHeight)
  output$oms <- renderPrint(input$mySex)
  output$oss <- renderPrint(input$spouseSex)
  
#  if (input$mySex == "Male" )
#    meanht1 <- mean(output$omh, 1.08 * output$oyh)
#  else
  meanht1 <- reactive(mean(sfactor(input$mySex) * c(input$myHeight, input$spouseHeight)))
  output$och <- renderPrint(predict1$coef[[1]] + predict1$coef[[2]] * meanht1())
  
}
)

