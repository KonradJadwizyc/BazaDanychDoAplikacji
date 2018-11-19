## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Climate_action <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  url2 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=12&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  dane <- read_json(url2, simplifyVector = T)
  str(dane,1)
  ramka_z_danymi <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal40 <- ramka_z_danymi %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal40) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal40_df <- data.frame(Goal40)
  return(Goal40_df)
  
}
