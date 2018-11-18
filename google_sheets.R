install.packages("googlesheets")
library(googlesheets)
# connect account
gs_auth(new_user = TRUE)

#
gs_new(title = "User data", ws_title = "first_sheet", input = target1.3.15)

# działa 
