## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 


Good_health <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  Good_health <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=3&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  dane <- read_json(Good_health, simplifyVector = T)
  str(dane,1)
  good_health_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal20 <- good_health_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal20) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal20_df <- data.frame(Goal20)
  return(Goal20_df)
}
