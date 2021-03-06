sidebarLayout(
  sidebarPanel (width = 4,
                wellPanel(
                  div(id = "panel",
                      style="text-align: center;",
                      h4(textOutput("modalName")),
                      div(id = "wiek",
                          style="text-align: center;"
                      )
                  ),
                  div(id = "kraj",
                      style="text-align: center;"
                  )
                )
                
  ),
  
  
  mainPanel(
    
    # img(src="E_SDG goals_icons-individual-cmyk-01.jpg", width = "20%"),
    actionLink("img_1", label = img(src="E_SDG goals_icons-individual-cmyk-01.jpg", width = "20%")),
    actionLink("img_2", label = img(src="E_SDG goals_icons-individual-cmyk-02.jpg", width = "20%")),
    # img(src="E_SDG goals_icons-individual-cmyk-01.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-02.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-03.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-04.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-05.jpg", width = "20%"),
    actionLink("img_1", label = img(src="E_SDG goals_icons-individual-cmyk-05.jpg", width = "20%")),
    # img(src="E_SDG goals_icons-individual-cmyk-06.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-07.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-08.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-09.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-10.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-11.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-12.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-13.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-14.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-15.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-16.jpg", width = "20%"),
    # img(src="E_SDG goals_icons-individual-cmyk-17.jpg", width = "20%"),
    actionLink("img_3", label = img(src="E_SDG goals_icons-individual-cmyk-03.jpg", width = "20%")),
    actionLink("img_4", label = img(src="E_SDG goals_icons-individual-cmyk-04.jpg", width = "20%")),
    actionLink("img_5", label = img(src="E_SDG goals_icons-individual-cmyk-05.jpg", width = "20%")),
    actionLink("img_6", label = img(src="E_SDG goals_icons-individual-cmyk-06.jpg", width = "20%")),
    actionLink("img_7", label = img(src="E_SDG goals_icons-individual-cmyk-07.jpg", width = "20%")),
    actionLink("img_8", label = img(src="E_SDG goals_icons-individual-cmyk-08.jpg", width = "20%")),
    actionLink("img_9", label = img(src="E_SDG goals_icons-individual-cmyk-09.jpg", width = "20%")),
    actionLink("img_10", label = img(src="E_SDG goals_icons-individual-cmyk-10.jpg", width = "20%")),
    actionLink("img_11", label = img(src="E_SDG goals_icons-individual-cmyk-11.jpg", width = "20%")),
    actionLink("img_12", label = img(src="E_SDG goals_icons-individual-cmyk-12.jpg", width = "20%")),
    actionLink("img_13", label = img(src="E_SDG goals_icons-individual-cmyk-13.jpg", width = "20%")),
    actionLink("img_14", label = img(src="E_SDG goals_icons-individual-cmyk-14.jpg", width = "20%")),
    actionLink("img_15", label = img(src="E_SDG goals_icons-individual-cmyk-15.jpg", width = "20%")),
    actionLink("img_16", label = img(src="E_SDG goals_icons-individual-cmyk-16.jpg", width = "20%")),
    actionLink("img_17", label = img(src="E_SDG goals_icons-individual-cmyk-17.jpg", width = "20%"))
    
  )
)