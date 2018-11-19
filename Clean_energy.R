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
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  Clean_water <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=6&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  dane3 <- read_json(Clean_water, simplifyVector = T)
  str(dane3,1)
  Clean_water_df <- dane3$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal3 <- Clean_water_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal3) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal3_df <- data.frame(Goal3)
  return(Goal3_df)
}
