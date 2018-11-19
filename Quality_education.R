## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Quality_education <- function() {

Country_list()

## pobieram dane dla okreslonego kraju
## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  education <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=4&pageSize=1393'
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    

  dane <- read_json(education, simplifyVector = T)
  str(dane,1)
  education_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal4 <- education_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal4) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal4_df <- data.frame(Goal4)
  return(Goal4_df)
  
}
