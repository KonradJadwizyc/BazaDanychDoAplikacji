## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 


Country_list <- function{(
  url1 <- 'https://unstats.un.org/SDGAPI/v1/sdg/GeoArea/List'
  read_json(url1, simplifyVector = T)
})
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  
  url2 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=4&pageSize=1393'
  dane <- read_json(url2, simplifyVector = T)
  str(dane,1)
  ramka_z_danymi <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal <- ramka_z_danymi %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  