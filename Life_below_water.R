## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Life_below_water <- function() {
  

  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  below_water <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=14.5&pageSize=11685')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  Goal_14 <- below_water$data
  Goal_14_df <- Goal_14
 
  return(Goal_14_df)
  
}

Goal_14 <- Life_below_water()
