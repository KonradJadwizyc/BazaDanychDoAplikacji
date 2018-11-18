
## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
library(plotly)
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
#str(dane1,1)
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
a <- No_poverty()
# nadanie dla komurki Value wartości numerycznych
a$Value <- as.numeric(as.character(a$Value))
# filtrowanie zbioru kolumn country

a1 <- a %>% filter(Country == c("Colombia","Greece","Uzbekistan","Canada"))

# wizualizacja zbioru a1 
p <- plot_ly(a1, x = ~Time, y = ~Value, type = "scatter",mode = "line+markers" , color = ~Country)




No_poverty1.2 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.2'
dane2 <- read_json(No_poverty1.2, simplifyVector = T)
No_poverty1.2_df <- dane2$data 


No_povert1.1.1 <- "https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.1.1"
dane3 <- read_json(No_povert1.1.1, simplifyVector = T)
No_povert1.1.1_df <- dane3$data



No_poverty1.1 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.3'
dane4 <- read_json(No_poverty1.1, simplifyVector = T)
No_poverty1.1_df <- dane4$data 















