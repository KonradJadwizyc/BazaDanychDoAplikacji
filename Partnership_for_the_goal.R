## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Partnership_for_the_goal <- function() {


## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  partnership <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=17.2&pageSize=2432')
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    
  
  Goal_17 <- partnership$data
  Goal_17_df <- Goal_17
  
  return(Goal_17_df)
  
}

Goal_17 <- Partnership_for_the_goal()
