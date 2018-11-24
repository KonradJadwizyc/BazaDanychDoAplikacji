## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Clean_energy <- function() {
  
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      energy <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=7.1&pageSize=14531')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  Goal_7 <- energy$data
  Goal_7_df <- Goal_7 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_7_df) <- c("Geo_ID",
                           "Country",
                           "Time",
                           "Value",
                           "Series",
                           "Description")

  return(Goal_7_df)
  
}
Goal_7 <- Clean_energy()
