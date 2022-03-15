library(tidyverse)
library(dplyr)
library(ggplot2)
install.packages("fbRanks")
library(fbRanks)

#Fijar Ruta para obtener datos
setwd("E:/Bedu/project_in_r/data")
getwd()
datos_soccer_19_22<- read.csv("season_20192022.csv")

#Crear  Small Data df
SmallData <- select(datos_soccer_19_22, Date,
                    HomeTeam, FTHG, AwayTeam,FTAG)
names(SmallData)[1]<-"date"
names(SmallData)[2]<-"home.team"
names(SmallData)[3]<-"home.score"
names(SmallData)[4]<-"away.team"
names(SmallData)[5]<-"away.score"
write.csv(SmallData, "soccer.csv", row.names = F)
SmallData$date<- as.Date(SmallData$date, format="%Y-%m-%d")
str(SmallData)
listasoccer <- create.fbRanks.dataframes(
  scores.file = "E:/Bedu/project_in_r/data/soccer.csv")
(listasoccer <- create.fbRanks.dataframes(scores.file = 'soccer.csv', date.format = "%Y-%m-%d"))
listasoccer
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

fecha <- unique(SmallData$date)
str(fecha)
n <- length(fecha)
n
ranking <- rank.teams(anotaciones, teams = equipos, 
                      max.date = fecha[n-1], min.date = fecha[1], 
                      date.format = "%d/%m/%Y")
predict(ranking, date = fecha[n])

SmallData[SmallData$date == fecha[n],]
