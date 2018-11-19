

fluidPage(
  useShinyjs(),
  br(),br(),br(),
  
  navbarPage("SDG", id = "navbar", position = "fixed-top", theme = shinytheme("united"),
             tabPanel("Start", source("ui/StartUi.R")$value),
             tabPanel("No Poverty", source("ui/CeleUi.R")$value)
    
    )
  )

