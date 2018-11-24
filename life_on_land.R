## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Life_on_land <- function() {


  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  life_no_land <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=15.1&pageSize=2511')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Goal_15 <- life_no_land$data
  Goal_15_df <- Goal_15 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_15_df) <- c("Geo_ID",
                            "Country",
                            "Time",
                            "Value",
                            "Series",
                            "Description")
 
  return(Goal_15_df)
  
}

Goal_15 <- Life_below_water()

# dodac indicator i filtrowanie po series