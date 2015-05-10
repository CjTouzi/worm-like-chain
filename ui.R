library(rCharts)

# dat <- read.csv('data.csv')

# Define UI 
shinyUI(fluidPage(

    title = "Worm Like Chain App",
    hr(),
    fluidRow(
        h2("Worm Like Chain App"),
        h5("2015- today all right reserved by Cheng Juan"),
        hr()
        ),
    fluidRow(
                column(3,
                       h3("Read Me First"),
                       h4("An interpolation formula that approximates the force-extension behavior is"),
                       withMathJax(h4("$$\\frac{FP}{k_BT}=\\frac{1}{4}(1-\\frac{x}{L_0})^{-2}- \\frac{1}{4} + \\frac{x}{L_0} $$")),  
                       h4("Reference: J. F. Marko, E. D. Siggia, 1995"),
                       hr(),
                       h4("The formula tells that force-extension behavior replys on Persistence Length(P) and contour length (L0)"),
                       h4("Here, L0=Contour Length Per Base* Total Number of Bases"),
                       h4("Now let's visualize what happens when changing these parameters"),
                       h4("Have Fun!")
                       ),
                column(9,
                       showOutput("plot", "highcharts")
                       
                )
                
            ),
    

    # hr(),
    fluidRow(
 
        column(3,
               hr(),hr(),
               h4("- Click the legends to hide one curve"),
               h4("- Move cursor along the curve to see the numbers")
        ),

        column(2,
               h4("LPB (nm)"),
               helpText("Contour Length Per Base"),
               numericInput("LPB1", label = h3("DNA1"), value = 0.34),
               numericInput("LPB2", label = h3("DNA2"), value = 0.6)
        ),        
        column(2,
               h4("N"),
               helpText("Total Number of Bases"),
               numericInput("N1", label = h3("DNA1"), value = 1000),
               numericInput("N2", label = h3("DNA2"), value = 1000)
        ),
        column(2,
               h4("P (nm)"),
               helpText("Persistence Lengths"),
               numericInput("P1", label = h3("DNA1"), value = 50),
               numericInput("P2", label = h3("DNA2"), value = 2)
        ),
        
        column(2,
               h4("force range (pN)"),
               helpText("adjust x-axix range here"),
               numericInput("fmin", label = h3("Minimum Force"), value = 0),
               numericInput("fmax", label = h3("Maximum Force"), value = 20)
        )
        
        )
 
    )
)