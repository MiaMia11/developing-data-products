library(shiny)
BMI<-function(weight,height) {weight/(height^2)}
diagnostic_f<-function(weight,height){
  BMI_value<-weight/(height^2)
  ifelse(BMI_value<15,"Very severely underweight",ifelse(BMI_value<16,"Severely underweight",ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<25,"Healthy weight",ifelse(BMI_value<30,"Overweight",ifelse(BMI_value<35,"Moderately obese",ifelse(BMI_value<40,"Severely obese"," Very severely obese")))))))
}
shinyServer(
  function(input, output) {
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
  }
)
