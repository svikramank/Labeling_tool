library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title=h3("Data Labeling Tool for Supervised Machine Learning", align = "center")),
  sidebarLayout(
    sidebarPanel(
      h5("Powered By:"),
      tags$img(src = "logo.png", height = "100", width = "100"),
      br(),
      h4(helpText("If you see an ERROR, click on NEXT to get started")),
      br(),
      h6(helpText("Click here to label the image as Cat")),
      actionButton("cat", "Cat"),
      br(),
      h6(helpText("Click here to label the image as Dog")),
      actionButton("dog", "Dog"),
      br(),
      br(),
      fluidRow(
        column(4,offset = 0, actionButton("prev", "<< Previous")),
        column(4, offset = 3, actionButton("nextt", "Next >>"))
      ),
      br(),
      br(),
      downloadButton("dw", "Download the labelled data")
      ),

    mainPanel(uiOutput("tb"))
  )
)
)