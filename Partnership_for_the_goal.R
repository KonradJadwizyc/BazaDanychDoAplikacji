## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Partnership_for_the_goal <- function() {

Country_list()

## pobieram dane dla okreslonego kraju
## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  partnership <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=16&pageSize=1393'
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    

  dane <- read_json(partnership, simplifyVector = T)
  str(dane,1)
  partnership_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal16 <- partnership_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal16) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal16_df <- data.frame(Goal16)
  return(Goal16_df)
  
}
