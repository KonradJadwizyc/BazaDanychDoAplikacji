## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Reduce_inequalities <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  reduce_inequalities <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=9&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  dane4 <- read_json(reduce_inequalities, simplifyVector = T)
  str(dane,1)
  reduce_inequalities_df <- dane4$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal4 <- reduce_inequalities_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal4) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal4_df <- data.frame(Goal4)
  return(Goal4_df)
}
