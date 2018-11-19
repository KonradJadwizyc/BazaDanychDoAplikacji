## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Decent_work <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  Decent_work <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=7&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
  dane <- read_json(Decent_work, simplifyVector = T)
  str(dane,1)
  Decent_work_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal30 <- ramka_z_danymi %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal30) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal30_df <- data.frame(Goal30)
  return(Goal30_df)
}
