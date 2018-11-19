
## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
library(plotly)
 

No_poverty <- function() {

## pobieram dane dla okreslonego celu
## trzeba ustawiac argumenty zapytania przez page, pageSize, czyli to co jest opisane w Parameters
  if(have_ip() == T) {
    
    tryCatch({ # w przypadku baraku internetu wywoła wyjątek
      
No_poverty <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.1.1&pageSIze=9454")
    }, error = function(err) {
      
      warning("You used bad link!")
      
    })
    
  }else{
    
    warning("You lost connection to internet!")
    
  } 
  
Goal_1 <- No_poverty$data %>% 
    select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription) %>% 
    filter(series == "SI_POV_EMP1")
  
  # oczyszczanie dzanych 
  # zmiana nazw kolumn

  colnames(Goal_1) <- c("Geo_ID",
                       "Country",
                       "Time",
                       "Value",
                       "Series",
                       "Description")
 
return(Goal_1)
  
}
# wywołanie data.farme dla Goal 1 
Goal_1 <- No_poverty()

# utworzenie targetu 1 wyciąganie wszystkich targetów i tworzenie osobnych ramek danych
Target_1.1.2_df <- Target_1.1.1 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription) %>% 
  filter(series == "SI_POV_DAY1")

# zmiana nazw kolumn
colnames(Target_1.1.2_df) <- c("Geo_ID",
                               "Country",
                               "Time",
                               "Value",
                               "Series",
                               "Description")

# target 1.2 
Target_1.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.2&pageSize=732')
Target_1.2 <- Target_1.2$data 
Target_1.2_df <- Target_1.2 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)


colnames(test) <- c("Geo_ID",
                    "Country",
                    "Time",
                    "Value",
                    "Series",
                    "Description")

# target 1.3 
Target_1.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.3&pageSize=2403')
Target_1.3 <- Target_1.3$data
Target_1.3_df <- Target_1.3  %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(Target_1.3_df) <- c("Geo_ID",
                               "Country",
                               "Time",
                               "Value",
                               "Series",
                               "Description")
# wywołanie idnicator dla target 1.3 
target1.3.1 <- Target_1.3_df %>% filter(Series == "SI_COV_CHLD")
target1.3.2 <- Target_1.3_df %>% filter(Series == "SI_COV_WKINJRY")
target1.3.3 <- Target_1.3_df %>% filter(Series == "SI_COV_MATNL")
target1.3.4 <- Target_1.3_df %>% filter(Series == "SI_COV_POOR")
target1.3.5 <- Target_1.3_df %>% filter(Series == "SI_COV_PENSN")
target1.3.6 <- Target_1.3_df %>% filter(Series == "SI_COV_BENFTS")
target1.3.7 <- Target_1.3_df %>% filter(Series == "SI_COV_DISAB")
target1.3.8 <- Target_1.3_df %>% filter(Series == "SI_COV_UEMP")
target1.3.9 <- Target_1.3_df %>% filter(Series == "SI_COV_VULN")
target1.3.10 <- Target_1.3_df %>% filter(Series == "SI_COV_LMKTPQ")
target1.3.11 <- Target_1.3_df %>% filter(Series == "SI_COV_SOCASTPQ")
target1.3.12 <- Target_1.3_df %>% filter(Series == "SI_COV_SOCINSPQ")
target1.3.13 <- Target_1.3_df %>% filter(Series == "SI_COV_LMKT")
target1.3.14 <- Target_1.3_df %>% filter(Series == "SI_COV_SOCAST")
target1.3.15 <- Target_1.3_df %>% filter(Series == "SI_COV_SOCINS")

# target 1.5
# indicator 1.5.1 za duży zbiór 

# indicator 1.5.2
indicator_1.5.2 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.5.2&pageSIze=36222')
indicator_1.5.2 <- indicator_1.5.2$data
indicator_1.5.2_df <- indicator_1.5.2 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(indicator_1.5.2_df) <- c("Geo_ID",
                             "Country",
                             "Time",
                             "Value",
                             "Series",
                             "Description")

# filtrowanie indicator 1.5.2 ze względu na kolumne series
indicator_1.5.2a <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_AGLN")
indicator_1.5.2b <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_AGLH")
indicator_1.5.2c <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_GDPLS")
indicator_1.5.2d <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_LSGP")
indicator_1.5.2e <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_HOLN")
indicator_1.5.2f <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_HOLH")
indicator_1.5.2g <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_CILN")
indicator_1.5.2h <- indicator_1.5.2_df %>% filter(Series == "VC_DSR_CHLN")

# indicator 1.5.3
indicator_1.5.3 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.5.3&pageSIze=543')
indicator_1.5.3 <- indicator_1.5.3$data 
indicator_1.5.3_df <- indicator_1.5.3 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(indicator_1.5.3_df) <- c("Geo_ID",
                               "Country",
                               "Time",
                               "Value",
                               "Series",
                               "Description")

# filtrowanie indicator ze względu na col series
indicator_1.5.3a <- indicator_1.5.3_df %>% filter(Series == "SG_DSR_LEGREG")
indicator_1.5.3b <- indicator_1.5.3_df %>% filter(Series == "SG_DSR_LGRGSR")

# indicator 1.5.4
indicator_1.5.4 <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?indicator=1.5.4&pageSIze=135')
indicator_1.5.4 <- indicator_1.5.4$data 
indicator_1.5.4_df <- indicator_1.5.4 %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(indicator_1.5.4_df) <- c("Geo_ID",
                               "Country",
                               "Time",
                               "Value",
                               "Series",
                               "Description")

indicator_1.5.4a <- indicator_1.5.4_df %>% filter(Series == "SG_GOV_LOGV")
indicator_1.5.4b <- indicator_1.5.4_df %>% filter(Series == "SG_DSR_SILN")
indicator_1.5.4c <- indicator_1.5.4_df %>% filter(Series == "SG_DSR_SILS")


# Target 1.a
Target_1.a <- fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Target/Data?target=1.a&pageSize=1819')
Target_1.a <- Target_1.a$data
Target_1.a_df <- Target_1.a %>% select(geoAreaCode,geoAreaName,timePeriodStart,value,series,seriesDescription)

colnames(Target_1.a_df) <- c("Geo_ID",
                               "Country",
                               "Time",
                               "Value",
                               "Series",
                               "Description")
# all good 







