## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Peace_and_justic <- function() {

Country_list()

## pobieram dane dla okreslonego kraju
## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
if(have_ip() == T) {
  
  
  
  tryCatch({ # w przypadku baraku internetu wywoła wyjątek
  
  peace <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=15&pageSize=1393'
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })
  
}else{
  
  warning("You lost connection to internet!")
  
}    

  dane <- read_json(peace, simplifyVector = T)
  str(dane,1)
  peace_df <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal13 <- peace_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal13) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal13_df <- data.frame(Goal13)
  return(Goal13_df)
  
}
