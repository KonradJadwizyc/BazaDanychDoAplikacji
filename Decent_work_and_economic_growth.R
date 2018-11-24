## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Decent_work <- function() {

  
  ## pobieram dane dla okreslonego celu
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  Decent_work <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=8.1&pageSize=4227')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Goal_8 <- Decent_work$data
  Goal_8_df <- Goal_8 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_8_df) <- c("Geo_ID",
                            "Country",
                            "Time",
                            "Value",
                            "Series",
                            "Description")
  
  return(Goal_8_df)
  
}

Goal_8 <- Decent_work()
