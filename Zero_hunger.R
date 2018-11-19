## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
## pobieram listę krajów 

Zero_hunger <- function() {
  
  
  if(have_ip() == T) {
    
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
      Zero_hunger <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.1&pageSize=4632')
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  }  
  # oczyszczanie dzanych 
  # dane globalne
  Target_2.1 <- Zero_hunger$data
  Target_2.1_df <- Target_2.1 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)
  
  colnames(Target_2.1_df) <- c("Geo_ID",
                                "Country",
                                "Time",
                                "Value",
                                "Series",
                                "Description")

  return(Target_2.1_df)
  
}
# data frame dla celu 2 
Goal_2 <- Zero_hunger()

# indicator 2.1.1 z podziałem na col series
indicator_2.1.1 <- Target_2.1_df %>% filter(Series == "SN_ITK_DEFC")
indicator_2.1.2 <- Target_2.1_df %>% filter(Series == "AG_PRD_FIESMSI")
indicator_2.1.2a <- Target_2.1_df %>% filter(Series == "AG_PRD_FIESSI")
indicator_2.1.2b <- Target_2.1_df %>% filter(Series == "AG_PRD_FIESMSIN")
indicator_2.1.2c <- Target_2.1_df %>% filter(Series == "AG_PRD_FIESSIN")

# target 2.2
Target_2.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.2&pageSize=2453')
Target_2.2 <- Target_2.2$data
Target_2.2_df <- Target_2.2 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(Target_2.2_df) <- c("Geo_ID",
                             "Country",
                             "Time",
                             "Value",
                             "Series",
                             "Description")

# indicator 2.2.1 z podziałem według col series
indicator_2.2.1a <- Target_2.2_df %>% filter(Series == "SH_STA_STUNTN")
indicator_2.2.1b <- Target_2.2_df %>% filter(Series == "SH_STA_STUNT")

indicator_2.2.2a <- Target_2.2_df %>% filter(Series == "SH_STA_OVRWGTN")
indicator_2.2.2b <- Target_2.2_df %>% filter(Series == "SH_STA_WASTEN")
indicator_2.2.2c <- Target_2.2_df %>% filter(Series == "SH_STA_OVRWGT")
indicator_2.2.2c <- Target_2.2_df %>% filter(Series == "SH_STA_WASTE")


# target 2.5
Target_2.5 <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.5&pageSize=25990")
Target_2.5 <- Target_2.5$data 
Target_2.5_df <- Target_2.5 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(Target_2.5_df) <- c("Geo_ID",
                               "Country",
                               "Time",
                               "Value",
                               "Series",
                               "Description")

# indicator 2.5.1 za dużo danych 
indicator_2.5.1a <- Target_2.5_df %>% filter(Series == "ER_GRF_ANIMRCNTN")
indicator_2.5.1b <- Target_2.5_df %>% filter(Series == "ER_GRF_ANIMKPT")
indicator_2.5.1c <- Target_2.5_df %>% filter(Series == "ER_GRF_ANIMSTORN")
indicator_2.5.1d <- Target_2.5_df %>% filter(Series == "ER_GRF_PLNTSTOR")
indicator_2.5.1e <- Target_2.5_df %>% filter(Series == "ER_GRF_ANIMRCNT")
indicator_2.5.1f <- Target_2.5_df %>% filter(Series == "ER_GRF_ANIMSTOR")

# indicator 2.5.2 za duzo danych 

indicator_2.5.2a <- Target_2.5_df %>% filter(Series == "ER_UNK_LBREDN")
indicator_2.5.2b <- Target_2.5_df %>% filter(Series == "ER_NRK_LBREDN")
indicator_2.5.2c <- Target_2.5_df %>% filter(Series == "ER_RSK_LBREDN")
indicator_2.5.2d <- Target_2.5_df %>% filter(Series == "ER_UNK_LBRED")
indicator_2.5.2e <- Target_2.5_df %>% filter(Series == "ER_NRK_LBRED")
indicator_2.5.2f <- Target_2.5_df %>% filter(Series == "ER_RSK_LBRED")

# target 2.a 
Target_2.a <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.a&pageSize=5161")
Target_2.a <- Target_2.a$data 
Target_2.a_df <- Target_2.a %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(Target_2.a_df) <- c("Geo_ID",
                             "Country",
                             "Time",
                             "Value",
                             "Series",
                             "Description")
# indicator 2.a.1  
indicator_2.a.1 <- Target_2.a_df %>% filter(Series == "AG_PRD_ORTIND")
indicator_2.a.2 <- Target_2.a_df %>% filter(Series == "DC_TOF_AGRL")

# target 2.b
Target_2.b <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.b&pageSize=272")
Target_2.b <- Target_2.b$data 
Target_2.b_df <- Target_2.b %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(Target_2.b_df) <- c("Geo_ID",
                             "Country",
                             "Time",
                             "Value",
                             "Series",
                             "Description")

# target 2.c 
target_2.c <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=2.c&pageSize=167")
target_2.c <- target_2.c$data 
target_2.c_df <- target_2.c %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(target_2.c_df) <- c("Geo_ID",
                             "Country",
                             "Time",
                             "Value",
                             "Series",
                             "Description")

# all good 
# przykład całej bazy dla Zero_hungry
