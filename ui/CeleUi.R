Goal_1 <- No_poverty()
Goal_1_manager <- Goal_1 %>% filter(Description == "Employed population below international poverty line, by sex and age (%)")
sidebarLayout(
  sidebarPanel(
    div(id = "panel",
        style="text-align: center;",
        h4(textOutput("modalName"))),
    div(id = "upper_panel",
        style="text-align: center;",
        selectInput(
          inputId = "poverty",
          
          label = "Choose data you want to see!",
          
          choices = (c("No Poverty")),
          selected = "No Poverty"
        )),
    
    div(id = 'hidden_part',
        style="text-align: center;",
        uiOutput("searchPriceUI"),
        selectizeInput(
          inputId = "searchCountry",
          label = "Choose countries to compare:",
          choices = c(as.character(unique(Goal_1_manager$Country))),
          multiple = TRUE,
          selected = "Poland",
          options = list(maxItems = 5,
                         placeholder = "Choose countries (max. 5)")
        ),
        
        radioButtons(
          inputId = "Choose_topic",
          label = "Choose topics interesting for you:",
          choices = c("% of women in managarial positions", "% of women in government"),
          selected = NULL
        ),
        
        radioButtons(
          inputId = "chartType",
          label = "Choose chart type!",
          choices = c("bar", "line", "pie"),
          selected = "line"
        )),
    
    
    actionButton("add_my_page", 
                 "Add this plot to your page"),
    
    br(),
    br(),
    
    actionButton("add_to_quiz", 
                 "Add this chart to quiz")
    
    
    
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Other countries",
               conditionalPanel(
                 condition = "input.chartType == 'line'",
                 plotlyOutput("plot_inter")
               ),
               conditionalPanel(
                 condition = "input.chartType == 'bar'",
                 plotlyOutput("plot_inter_bar")
               ),
               conditionalPanel(
                 condition = "input.chartType == 'pie'",
                 plotlyOutput("plot_inter_pie")
               )
      ),
      tabPanel(
        "Poland",
        plotlyOutput("plot_poland")
      )
      
    )
  )
)