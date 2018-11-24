## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Climate_action <- function() {


  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
      Climate <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=13.1&pageSize=2574')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Goal_13 <- Climate$data
  Goal_13_df <- Goal_13 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_13_df) <- c("Geo_ID",
                           "Country",
                           "Time",
                           "Value",
                           "Series",
                           "Description")
  
  return(Goal_13_df)
  
}

Goal_13 <- Climate_action()
