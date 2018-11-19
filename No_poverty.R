
## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

No_poverty <- function() {

Country_list()

## pobieram dane dla okreslonego kraju
## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
No_poverty <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/Data?page=1&pageSize=1393'
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }    
dane1 <- read_json(No_poverty, simplifyVector = T)
str(dane1,1)
No_poverty_df <- dane1$data 

# oczyszczanie dzanych 
# dane globalne
Goal1 <- No_poverty_df %>% select(c(geoAreaCode,geoAreaName,timePeriodStart,value,seriesDescription)) %>%
  group_by(timePeriodStart,geoAreaName)
# zmiana nazw kolumn
colnames(Goal1) <- c("Geo_ID",
                     "Country",
                     "Time",
                     "Value",
                     "Description")


Goal1_df <- data.frame(Goal1)
return(Goal1_df)

}
  