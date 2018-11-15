## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 
Reduce_inequalities <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  
  reduce_inequalities <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=9&pageSize=1393'
  dane4 <- read_json(reduce_inequalities, simplifyVector = T)
  str(dane,1)
  reduce_inequalities_df <- dane4$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal4 <- reduce_inequalities_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
}