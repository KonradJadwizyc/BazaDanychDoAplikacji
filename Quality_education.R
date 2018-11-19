## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Quality_education <- function() {


## pobieram dane dla okreslonego celu
## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  education <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=4.1&pageSize=3870")
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal_4 <- education$data
  
  Goal_4_df <- Goal_4 
  
  
  return(Goal_4_df)
  
}

Goal_4 <- Quality_education()
