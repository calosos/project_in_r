#Fijar Ruta para obtener datos
setwd("E:/project_in_r")
getwd()

#Obtener y guardar datos
datos_soccer_20_21<- read.csv(choose.files()) 
View(datos_soccer_20_21)


goles_casa_visita <- data.frame(datos_soccer_20_21$FTHG, datos_soccer_20_21$FTAG)
View(goles_casa_visita)
names(goles_casa_visita)[1]<-"FTHG" ;names(goles_casa_visita)[2]<-"FTAG"

#Se calcula la frecuancia absoluta de FTHG
(FTHG_frec_absoluta <- table(goles_casa_visita$FTHG))
FTHG_frec_relativa <- prop.table(FTHG_frec_absoluta)
FTHG_frec_absoluta_df <- data.frame( table(goles_casa_visita$FTHG))

#Se calcula la frecuancia absoluta de FTAG
FTAG_frec_absoluta <- table(goles_casa_visita$FTAG)
FTAG_frec_relativa <- prop.table(FTAG_frec_absoluta)
FTAG_frec_absoluta_df <- data.frame( table(goles_casa_visita$FTAG))

#Probabilidad marginal FTHG
total_partidos <-length(goles_casa_visita$FTHG)

(prob_marg_FTHG <- FTHG_frec_absoluta_df$Freq/ total_partidos*100)


#Probabilidad marginal FTAG
(prob_marg_FTAG <- FTAG_frec_absoluta_df$Freq/ total_partidos*100)


###
View(goles_casa_visita)
table(goles_casa_visita$FTHG, goles_casa_visita$FTAG )

length(goles_casa_visita$FTHG)
