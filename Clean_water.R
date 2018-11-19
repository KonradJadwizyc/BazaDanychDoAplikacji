## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

 Clear_water <- function() {

  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
      water <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=6.1&pageSize=3395')
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })

}else{
  
  warning("You lost connection to internet!")
  
}    
  
  # oczyszczanie dzanych 
  # dane globalne
   
  Goal_6 <- water$data
  Goal_6_df <- Goal_6
  
  return(Goal_6_df)
  
 }
 
Goal_6 <- Clear_water()
