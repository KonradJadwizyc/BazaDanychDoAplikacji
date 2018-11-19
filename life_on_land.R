## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Life_on_land <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  life_no_land <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=14&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  
  dane <- read_json(life_no_land, simplifyVector = T)
  str(dane,1)
  life_no_land_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal23 <- life_no_land_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal23) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal23_df <- data.frame(Goal23)
  return(Goal23_df)
  
}
