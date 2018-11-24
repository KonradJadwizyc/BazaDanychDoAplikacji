## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Gender_equality <- function() {
  
  
  ## pobieram dane dla okreslonego celu
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
      equality <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=5.4&pageSize=5640")
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal_5 <- equality$data
  
  Goal_5_df <- Goal_5 %>%  select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_5_df) <- c("Geo_ID",
                           "Country",
                           "Time",
                           "Value",
                           "Series",
                           "Description")
  
  
  return(Goal_5_df)
  
}

Goal_5 <- Gender_equality()
