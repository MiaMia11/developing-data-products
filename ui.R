library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Adult body Mass Index (BMI) Calculator"),
    sidebarPanel(
      numericInput('weight', 'Enter your weight in kilograms', 60) ,
      numericInput('height', 'Enter your height in meters', 1.65, min = 0.4, max = 2.5, step = 0.01),
      submitButton('Submit')
    ),
    mainPanel(
      p('Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.'),
      p('The World Health Organization (WHO) proposes the following classification:'),
      tags$div(
        tags$ul(
          tags$li('BMI < 15 : Very severely underweight'),
          tags$li('BMI [15-16] : Severely underweight'),
          tags$li('BMI [16-18.5] : Underweight'),
          tags$li('BMI [18.5-25] : Healthy weight'),
          tags$li('BMI [25-30] : Overweight'),
          tags$li('BMI [30-35] : Moderately obese'),
          tags$li('BMI [35-40] Severely obese'),
          tags$li('BMI > 40 : Very severely obese')
        )
      ),
      h4('Values entered by you:'),
      p('weight:'), verbatimTextOutput("inputweightvalue"),
      p('height:'), verbatimTextOutput("inputheightvalue"),
      h4('Your BMI is:'),
      verbatimTextOutput("estimation"),
      h4('You are classified as:'),strong(verbatimTextOutput("diagnostic"))
    )
  )
)
