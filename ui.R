n<-10

shinyUI(
  pageWithSidebar(
    headerPanel("Gaussian comparison"),
    
    sidebarPanel(
      h3("First Gaussian"),
      numericInput("mu1","Mu", 0),
      numericInput("sigma1","Sigma", 1),
      selectInput("n1", "Number of points", c(10,100, 1000, 10000, 100000, 1000000), selected=1000),
      
      h3("Second Gaussian"),
      numericInput("mu2","Mu", 0),
      numericInput("sigma2","Sigma", 1),
      selectInput("n2", "Number of points", c(10,100, 1000, 10000, 100000, 1000000), selected=1000),
      
      submitButton('Submit')
    ),
    
    mainPanel(
      h3('Histogram'),
      plotOutput("plot"),
      h4('Confidence interval for mu1-mu2'),
      verbatimTextOutput("confint_low"),
      verbatimTextOutput("confint_high"),
      h4('p-value'),
      verbatimTextOutput("p")
    )
  )
)
