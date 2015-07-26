library(ggplot2)

compute <- function(input) {

  set.seed(1)
  
  mu1 <- input$mu1
sigma1 <- input$sigma1
n1 <- as.numeric(input$n1)

mu2 <- input$mu2
sigma2 <- input$sigma2
n2 <- as.numeric(input$n2)

library(ggplot2)
draw1 <- data.frame( x = rnorm(n1,mean=mu1,sd=sigma1))
draw2 <- data.frame( x = rnorm(n2,mean=mu2,sd=sigma2))

p<- ggplot(data=draw1, aes(x=x))
p <- p + geom_histogram(binwidth=0.1, fill="red", alpha = 0.5)
p <- p + geom_histogram(data=draw2, aes(x=x), binwidth=0.1, fill="blue", alpha = 0.5)

test <-t.test(draw1$x, draw2$x)

list(plot = p, confint_low = test$conf.int[1], confint_high = test$conf.int[2], p = test$p.value) 
}

shinyServer(
  function(input, output) {
    
    results <- reactive(compute(input))
    output$plot <- renderPlot(results()$plot)

    output$confint_low = renderPrint(results()$confint_low)
    output$confint_high = renderPrint(results()$confint_high)
    output$p = renderPrint((results()$p))
    
  }
)
