## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Responsible_consumption <- function() {

Country_list()

## pobieram dane dla okreslonego kraju
## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  respponsible <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=11&pageSize=1393'
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    

  dane <- read_json(respponsible, simplifyVector = T)
  str(dane,1)
  respponsible_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal21 <- respponsible_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal21) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal21_df <- data.frame(Goal21)
  return(Goal21_df)

} 
