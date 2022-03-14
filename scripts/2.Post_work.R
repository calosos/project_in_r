library(tidyverse)
library(dplyr)
#Fijar Ruta para obtener datos
setwd("E:/Bedu/project_in_r/data")
getwd()
lista_uno <- lapply(dir(), read.csv) 
lista_uno
lista_dos <- lapply(lista_uno, select, Date,HomeTeam:FTR)
head(lista_dos[[1]]); head(lista_dos[[2]]); head(lista_dos[[3]]); 
View(lista_uno)
str(lista_dos)
summary(lista_dos)
datos_juntos <- do.call(rbind, lista_dos)
datos_juntos$Date <- as.Date(datos_juntos$Date, format="%d/%m/%Y")
head(datos_juntos)

#######################################################
season_20192020<-data.frame(read.csv("Season 20192020.csv"))
View(season_20192020); str(season_20192020);
summary(season_20192020); head(season_20192020)

season_20202021<-data.frame(read.csv("Season 20202021.csv"))
View(season_20202021)
str(season_20202021)
summary(season_20202021)
head(season_20202021)

season_20212022<-data.frame(read.csv("Season 20212022.csv"))
View(season_20212022); str(season_20212022);
summary(season_20212022); head(season_20212022)

season_20192020_select <- select(season_20192020, Date, HomeTeam:FTR)
season_20202021_select <- select(season_20202021, Date, HomeTeam:FTR)
season_20112022_select <- select(season_20212022, Date, HomeTeam:FTR)
str(season_20192020_select)

season_20192022<- rbind(season_20192020_select,season_20202021_select, season_20112022_select)

season_20192022$Date<- as.Date(season_20192022$Date, format="%d/%m/%Y") 
str(season_20192022)

write.csv(season_20192022,"season_20192022.csv")

