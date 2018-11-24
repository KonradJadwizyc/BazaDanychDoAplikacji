## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Industry <- function() { 


  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  industry <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=9.1&pageSize=1197')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Goal_9 <- industry$data
  Goal_9_df <- Goal_9 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_9_df) <- c("Geo_ID",
                               "Country",
                               "Time",
                               "Value",
                               "Series",
                               "Description")
  
  return(Goal_9_df)
  
}

Goal_9 <- Industry()
