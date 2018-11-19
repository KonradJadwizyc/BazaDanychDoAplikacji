## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Life_below_water <- function() {
  

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  life_below_water <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=13&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  dane <- read_json(life_below_water, simplifyVector = T)
  str(dane,1)
  life_below_water_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal22 <- life_below_water_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  colnames(Goal22) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal22_df <- data.frame(Goal22)
  return(Goal22_df)
  
}
