install.packages("googlesheets")
library(googlesheets)
# connect account
gs_auth(new_user = TRUE)

#

gs <- gs_new(title = "User data", ws_title = "first_sheet", input = indicator_2.1.2c)
# dodawanie nowych wierszy do bazy
gs_add_row(gs, ws = "first_sheet", input = indicator_2.1.2b)
# działa 
