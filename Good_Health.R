## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 


Good_health <- function() {


  
  ## pobieram dane dla okreslonego celu 
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  Good_health <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=3.1&pageSize=10631')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  # oczyszczanie dzanych 
  # dane globalne
  
  # goal 3
  Goal_3 <- Good_health$data 
  Target_3.1 <- Goal_3 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  
  colnames(Target_3.1) <- c("Geo_ID",
                            "Country",
                            "Time",
                            "Value",
                            "Description")
  
  return(Target_3.1)
}
Goal_3 <- Good_health()

# do celów testowych 
