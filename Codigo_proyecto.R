#Fijar Ruta para obtener datos
setwd("C:/Proyecto_entregable_programación_y_estadistica_con_r")
getwd()

#Obtener y guardar datos
datos_soccer_20_21<- read.csv(choose.files()) 
View(datos_soccer_20_21)


goles_casa_visita <- data.frame(datos_soccer_20_21$FTHG, datos_soccer_20_21$FTAG)
View(goles_casa_visita)
names(goles_casa_visita)[1]<-"FTHG" ;names(goles_casa_visita)[2]<-"FTAG"

#Se calcula la frecuancia absoluta de FTHG
table(goles_casa_visita$FTHG)

table(goles_casa_visita$FTAG)
.

