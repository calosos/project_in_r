library(tidyverse)
library(dplyr)
library(ggplot2)
install.packages("fbRanks")
install.packages("tidyverse")
getwd()
url_match <- "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-06/Postwork/match.data.csv"
download.file(url = url_match, destfile = "match_data.csv",mode = "w" )
datos <- data.frame(read.csv("match_data.csv"))
str(datos)
datos$date <- as.Date(datos$date, format = "%Y-%m-%d")
(numeros <- length(datos$date))

sumagoles <-c()

for (i in 1:numeros) {
  sumagoles[i] <-datos$home.score[i]+datos$away.score[i]
}
sumagoles
datos <- cbind(datos, sumagoles)




data_prueba <- mutate(datos, date = as.Date(date, '%d/%m/%Y'))
str(data_prueba)
data_prueba[, 'year'] <- year(datos[,1])
data_prueba[,'month'] <- month(datos[,1])
data_prueba[,'unos'] <- rep(1, length(datos[,1]))
prom_men <- data_prueba %>% group_by(year, month, unos) %>% summarize(goles_prom_mes = mean(sumagoles))
datos <- as.data.frame(datos)


datos <- mutate(data, datos = as.Date(date, '%d/%m/%Y'))
data[, 'year'] <- year(data[,1])
data[,'month'] <- month(data[,1])
data[,'unos'] <- rep(1, length(data[,1]))
datos <- data %>% group_by(year, month, unos) %>% summarize(goles_prom_mes = mean(sumagoles))
datos <- as.data.frame(datos)
datos <- unite(datos, month_year, c(1,2,3), sep ="/")
datos <- mutate(datos, month_year = as.Date(month_year, '%Y/%m/%d'))
head(datos)



