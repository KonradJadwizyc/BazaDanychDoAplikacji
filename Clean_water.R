## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

 Clear_water <- function() {

Country_list()
  
  ## pobieram dane dla okreslonego kraju
  ## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
  url2 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=5&pageSize=1393'
  }, error = function(err) {
    
    warning("You used bad link!")
    
  })

}else{
  
  warning("You lost connection to internet!")
  
}    

  dane <- read_json(url2, simplifyVector = T)
  str(dane,1)
  ramka_z_danymi <- dane$data 
  
  # oczyszczanie dzanych 
  # dane globalne
  Goal50 <- ramka_z_danymi %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
    group_by(timePeriodStart,geoAreaName)
  
  colnames(Goal50) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Description")
  
  
  Goal50_df <- data.frame(Goal50)
  return(Goal50_df)
}
