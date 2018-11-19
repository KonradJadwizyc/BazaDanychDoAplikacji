## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Zero_hunger <- function() {
  
  if(have_ip() == T) {
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
      Zero_hunger <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=2&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  
  Zero_hunger <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=2&pageSize=1393'
  dane2 <- read_json(Zero_hunger, simplifyVector = T)
  str(dane2,1)
  Zero_hunger_df <- dane2$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal2 <- Zero_hunger_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  colnames(Goal2) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal2_df <- data.frame(Goal1)
  return(Goal2_df)
}
