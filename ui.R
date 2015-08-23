library(shiny)
shinyUI(pageWithSidebar(
headerPanel("Predicting your child's height"),
sidebarPanel(
sliderInput('myHeight', 'My Height in Inches', min=0,  max=120, value=60, step=1),
#radioButtons('mySex', 'Your Sex', list('M' = '1', 'F' = '2' )),
selectInput("mySex", "My Sex", choices=c("Male", "Female")),
sliderInput('spouseHeight', 'spouse\'s Height Height in Inches', min=0,  max=120, value=60, step=1),
selectInput("spouseSex", "Spouse Sex", choices=c("Female", "Male"))
#,
#radioButtons('spouseSex', 'Spouse Sex', list('M' = '1', 'F' = '2' )),
#submitButton('Predict My Child\'s height')
),
mainPanel(
  h4("Based on your height "),
  verbatimTextOutput("omh"),
  verbatimTextOutput("oms"),
  h4("and your spouse height"),
  verbatimTextOutput("oyh"),
  verbatimTextOutput("oss"),
  h3("Your child\'s predicted height is"),
  verbatimTextOutput("och")

)
))

