## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Responsible_consumption <- function() {




## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  respponsible <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=12.4&pageSize=841')
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    

  Goal_12 <- respponsible$data
  
  Goal_12_df <- Goal_12 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_12_df) <- c("Geo_ID",
                            "Country",
                            "Time",
                            "Value",
                            "Series",
                            "Description")
 
  return(Goal_12_df)

} 

Goal_12 <- Responsible_consumption()
