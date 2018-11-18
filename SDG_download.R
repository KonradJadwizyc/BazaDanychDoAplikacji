library(dplyr)


SDG <- read.csv("SDG.csv")

# goal 1 No_poverty 
Goal.1 <- SDG %>% filter(Goal == 1) %>% select(Goal,Target,Indicator,GeoAreaCode,GeoAreaName,TimePeriod,Value,SeriesCode,SeriesDescription)
# target 1.1
# indicator 1.1.1 
indicator_1.1.1 <- Goal.1 %>% filter(Target == 1.1, SeriesCode == "SI_POV_EMP1")
indicator_1.1.2 <- Goal.1 %>% filter(Target == 1.1, SeriesCode == "SI_POV_DAY1") 
# target 1.2
# indicator 1.2.1
indicator_1.2.1 <- Goal.1 %>% filter(Target == 1.2)
# target 1.3
# indicator 1.3.1
target1.3.1 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_CHLD")
target1.3.2 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_WKINJRY")
target1.3.3 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_MATNL")
target1.3.4 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_POOR")
target1.3.5 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_PENSN")
target1.3.6 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_BENFTS")
target1.3.7 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_DISAB")
target1.3.8 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_UEMP")
target1.3.9 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_VULN")
target1.3.10 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_LMKTPQ")
target1.3.11 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_SOCASTPQ")
target1.3.12 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_SOCINSPQ")
target1.3.13 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_LMKT")
target1.3.14 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_SOCAST")
target1.3.15 <- Goal.1 %>% filter(Target == 1.3,SeriesCode == "SI_COV_SOCINS")
# target 1.5 
# indicator 1.5.1
target1.5 <- Goal.1 %>% filter(Target == 1.5, Indicator == "1.5.1")
indicator1.1.5a <- target1.5 %>% filter(SeriesCode == "VC_DSR_DADN")
indicator1.1.5b <- target1.5 %>% filter(SeriesCode == "VC_DSR_DDHN")
indicator1.1.5c <- target1.5 %>% filter(SeriesCode == "VC_DSR_DYDN")
indicator1.1.5d <- target1.5 %>% filter(SeriesCode == "VC_DSR_DYHN")
indicator1.1.5e <- target1.5 %>% filter(SeriesCode == "VC_DSR_MTMN")
indicator1.1.5f <- target1.5 %>% filter(SeriesCode == "VC_DSR_MTMP")
indicator1.1.5g <- target1.5 %>% filter(SeriesCode == "VC_DSR_MMHN")
indicator1.1.5h <- target1.5 %>% filter(SeriesCode == "VC_DSR_MORT")
indicator1.1.5i <- target1.5 %>% filter(SeriesCode == "VC_DSR_DAFF")
indicator1.1.5j <- target1.5 %>% filter(SeriesCode == "VC_DSR_IJILN")
indicator1.1.5k <- target1.5 %>% filter(SeriesCode == "VC_DSR_MISS")
indicator1.1.5l <- target1.5 %>% filter(SeriesCode == "VC_DSR_AFFCT")
indicator1.1.5m <- target1.5 %>% filter(SeriesCode == "VC_DSR_PDAN")
indicator1.1.5n <- target1.5 %>% filter(SeriesCode == "VC_DSR_PDYN")
indicator1.1.5o <- target1.5 %>% filter(SeriesCode == "VC_DSR_PDLN")

# indicator 1.5.2
indicator1.5.2 <- Goal.1 %>% filter(Target == 1.5, Indicator == "1.5.2")
indicator1.1.5.2a <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_AGLN")
indicator1.1.5.2b <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_AGLH")
indicator1.1.5.2c <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_GDPLS")
indicator1.1.5.2d <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_LSGP")
indicator1.1.5.2e <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_HOLN")
indicator1.1.5.2f <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_HOLH")
indicator1.1.5.2g <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_CILN")
indicator1.1.5.2h <- indicator1.5.2 %>% filter(SeriesCode == "VC_DSR_CHLN")

# indicator 1.5.3
indicator_1.5.3 <- Goal.1 %>% filter(Target == 1.5, Indicator == "1.5.3", SeriesCode == "SG_DSR_LEGREG")
indicator_1.5.3.a <- Goal.1 %>% filter(Target == 1.5, Indicator == "1.5.3", SeriesCode == "SG_DSR_LGRGSR")

# indicator 1.5.4 
indicator_1.5.4 <- Goal.1 %>% filter(Target == 1.5, Indicator == "1.5.4", SeriesCode == "SG_GOV_LOGV")
indicator_1.5.3 <- Goal.1 %>% filter(Target == 1.5, Indicator == "1.5.4", SeriesCode == "SG_DSR_SILN")
indicator_1.5.3 <- Goal.1 %>% filter(Target == 1.5, Indicator == "1.5.4", SeriesCode == "SG_DSR_SILS")
# target 1.a
# indicator 1.a.2
indicator_1.a.2 <- Goal.1 %>% filter(Target == "1.a")





