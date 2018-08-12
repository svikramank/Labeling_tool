library(shiny)

shinyServer(
  
  function(input, output)
  {
    image_file = vector(mode = "character")
    label_name = vector(mode = "character")
    values = reactiveValues()
    values$df <- data.frame(Image = character(), Labels = character(), stringsAsFactors = FALSE)
    
    i = reactiveValues(data = 0)
    label = reactiveValues(data = NULL)
    
    observeEvent(input$nextt, {
      i$data <- i$data + 1
    })
    
    observeEvent(input$prev, {
      i$data <- i$data - 1
    })
    
    observeEvent(input$dog, {
      label$data <- "dog"
    })
    
    
    observeEvent(input$cat, {
      label$data <- "cat"
    })
    
    
    
    output$table <- renderTable({
      fa <- file.access(dir("./www/images"))
      c <- names(fa)
      c
    })
    
    
    output$image <- renderImage({
      fa <- file.access(dir("./www/images"))
      c <- names(fa)
      filename = normalizePath(file.path('./www/images', paste(c[i$data])))
      
      
      list(src = filename, height = 400, width = 500)
    }, deleteFile = FALSE)
    
    
    newEntry <- observe({
      if(input$cat | input$dog){
        isolate({
          fa <- file.access(dir("./www/images"))
          c <- names(fa)
          filename = normalizePath(file.path('./www/images', paste(c[i$data])))
          t <- as.numeric(i$data)
          image_file[t] <- filename
          label_name[t] <- label$data
          newLine <- isolate(c(image_file[t], label_name[t]))
          isolate(values$df[nrow(values$df)+1, ] <- newLine)
          values$df
        })
      }
    })
    
    
    output$ltab <- renderTable({
      values$df
    })
    
    
    dataset <- reactive({
      values$df
    })
    
    
    output$dw <- downloadHandler(
      filename = function(){
        paste("data-", Sys.Date(), '.csv', sep = "")
      },
      content = function(file){
        write.csv(dataset(), file, row.names = FALSE)
      }
    )
    
    
    
    output$tb <- renderUI({
      
      tabsetPanel(
        tabPanel("Data labeling", imageOutput("image")),
        tabPanel("Raw Data", tableOutput("table")),
        tabPanel("Labeled Data", tableOutput("ltab"))
      )
    })
    
  }
)