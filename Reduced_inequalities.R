## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Reduce_inequalities <- function() {


  
  ## pobieram dane dla okreslonego celu
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  reduce_inequalities <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=10.6&pageSize=14190')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Goal_10 <- reduce_inequalities$data
  Goal_10_df <- Goal_10 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Goal_10_df) <- c("Geo_ID",
                           "Country",
                           "Time",
                           "Value",
                           "Series",
                           "Description")
  
  return(Goal_10_df)
}

Goal_10 <- Reduce_inequalities()
