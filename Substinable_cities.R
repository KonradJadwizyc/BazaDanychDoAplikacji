## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Substinable_cities <- function() {

  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  substinable_cities <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=11.6&pageSize=655')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Goal_11 <- substinable_cities$data
  Goal_11_df <- Goal_11
  
  return(Goal_11_df)
  
}

Goal_11 <- Substinable_cities()
