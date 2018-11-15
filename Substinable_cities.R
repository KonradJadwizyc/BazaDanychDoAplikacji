## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Substinable_cities <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  
  substinable_cities <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=10&pageSize=1393'
  dane11 <- read_json(substinable_cities, simplifyVector = T)
  str(dane11,1)
  substinable_cities_df <- dane11$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal <- substinable_cities_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
}