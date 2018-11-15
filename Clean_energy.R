## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Clean_Water <- function() {
  
  # wczytanie krajów
  Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  
  Clean_water <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=6&pageSize=1393'
  dane3 <- read_json(Clean_water, simplifyVector = T)
  str(dane3,1)
  Clean_water_df <- dane3$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal3 <- Clean_water_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
}
