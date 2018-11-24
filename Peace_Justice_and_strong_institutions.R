## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Peace_and_justic <- function() {


## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  peace <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=16.1&pageSize=1920')
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    

  Goal_16 <- peace$data
  
  Goal_16_df <- Goal_16 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_16_df) <- c("Geo_ID",
                            "Country",
                            "Time",
                            "Value",
                            "Series",
                            "Description")
 
  return(Goal_16_df)
  
}

Goal_16 <- Peace_and_justic()
  
  # trzeba posortować indocator 