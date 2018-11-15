## pakiety
library(jsonlite)
library(tidyverse)
library(dplyr)
# funkcja pobierająca kraje

Country_list <- function() {
  url1 <- 'https://unstats.un.org/SDGAPI/v1/sdg/GeoArea/List'
  read_json(url1, simplifyVector = T)
}
