library(rCharts)

# dat <- read.csv('data.csv')
# 
# options(RCHART_WIDTH = 500)

shinyServer(function(input, output) {
    
    output$plot <- renderChart2({
        
            force_extension <- function (LPB=0.34, N=2000, P=50,fmin=0,fmax=20){  
            #     LPB <- 0.34
            #     N <- 1000
            #     P <- 50            
            L0 <-  LPB*N
            x <- seq(0.1*L0, 0.97*L0, length.out = 100)
            force <- (0.25/(1- x/L0)^2-0.25 + x/L0)* 4.114/P
            dat <- data.frame(extension_nm=x, force_pN=force)
            dat[which(dat$force_pN<fmax & dat$force_pN>fmin),]
            
        }
        fmin = input$fmin
        fmax = input$fmax
        
        
        DNA1<- cbind(force_extension(input$LPB1,input$N1,input$P1,fmin,fmax), id="DNA1")
        DNA2 <- cbind(force_extension(input$LPB2,input$N2,input$P2,fmin,fmax), id="DNA2")
        DNA <- rbind(DNA1, DNA2)
        DNA$id <- as.factor(DNA$id)
        
        h1 <- hPlot(
            x = "force_pN", 
            y = "extension_nm", 
            group= "id",
            data = DNA)
        h1

    })
})