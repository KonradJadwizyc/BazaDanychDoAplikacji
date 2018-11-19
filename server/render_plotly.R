observeEvent(input$img_1, {
  updateTabsetPanel(session, "navbar",
                    selected = "No Poverty")
  
})

observeEvent(input$add_my_page, {
  alert("You can download this chart ;) Just point mouse at the top of the chart and pick camera icon. ")
})

Goal_1 <- No_poverty()
Goal_1_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
library(tidyverse)


Goal_1_inter <- reactive(
  Goal_1_manager %>% filter(GeoAreaName == input$searchCountry)
)

output$plot_inter <- renderPlotly(
  p <- plot_ly(data = Goal_1_inter()) %>%
    add_lines( x = ~TimePeriod, y = ~Value, color = ~GeoAreaName, mode = "lines", line = list(width = 3))
)
############################################

observeEvent(input$img_2, {
  updateTabsetPanel(session, "navbar",
                    selected = "Education")
  
})

observeEvent(input$add_my_page, {
  alert("You can download this chart ;) Just point mouse at the top of the chart and pick camera icon. ")
})


data_manager <- data %>% filter(SeriesDescription == "Proportion of women in managerial positions (%)")
library(tidyverse)

data_manager <- data_manager[c(7, 8, 9)]
data_manager$Value <- as.numeric(as.character(data_manager$Value))
data_poland <- data_manager %>% filter(GeoAreaName == "Poland")
data_inter <- reactive(
  data_manager %>% filter(GeoAreaName == input$searchCountry)
)

output$plot_poland <- renderPlotly(
  plotly::plot_ly(data_poland, x= ~TimePeriod, y=~Value, type = "scatter", mode = "lines")
)

output$plot_inter <- renderPlotly(
  p <- plot_ly(data = data_inter()) %>%
    add_lines( x = ~TimePeriod, y = ~Value, color = ~GeoAreaName, mode = "lines", line = list(width = 3))
)
