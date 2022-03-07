#Fijar Ruta para obtener datos
setwd("C:/Proyecto_entregable_programación_y_estadistica_con_r")
getwd()

#Obtener y guardar datos
datos_soccer_20_21<- read.csv(choose.files()) 
View(datos_soccer_20_21)


goles_casa_visita <- data.frame(datos_soccer_20_21$FTHG, datos_soccer_20_21$FTAG)
View(goles_casa_visita)
names(goles_casa_visita)[1]<-"FTHG" ;names(goles_casa_visita)[2]<-"FTAG"
write.csv(goles_casa_visita,"Datos_goles_casa_visita.csv")

#Se calcula la frecuancia absoluta de FTHG
(frec_abs_FTHG <- table(goles_casa_visita$FTHG))
(frec_abs_FTHG_df <- data.frame(frec_abs_FTHG))
#Se calcula la frecuencia relativa de FTHG
(frec_relativa_FTHG <- prop.table(frec_abs_FTHG))
(frec_relativa_FTHG_df <- data.frame(frec_relativa_FTHG))

FTHG_abs_rel_df <- cbind(frec_abs_FTHG_df,frec_relativa_FTHG_df$Freq)
names(FTHG_abs_rel_df)[1]<-"#Goles" 
names(FTHG_abs_rel_df)[2]<-"Frecuencia Absoluta";
names(FTHG_abs_rel_df)[3]<-"Frecuencia Relativa"

#Probabilidad Marginasl FTHG
(numero_partidos <- length(goles_casa_visita$FTHG))
(prob_marg_FTHG <- FTHG_abs_rel_df$`Frecuencia Absoluta`/ numero_partidos)
FTHG_abs_rel_probmarg_df<-cbind(FTHG_abs_rel_df, prob_marg_FTHG)
names(FTHG_abs_rel_probmarg_df)[4]<-"Probabilidad Marginal"


###################################################

#Se calcula la frecuancia absoluta de FTAG
(frec_abs_FTAG <- table(goles_casa_visita$FTAG))
(frec_abs_FTAG_df <- data.frame(frec_abs_FTAG ))

#Se calcula la frecuencia relatica de FTHG
(frec_relativa_FTAG<- prop.table(frec_abs_FTAG))
(frec_relativa_FTAG_df <- data.frame(frec_relativa_FTAG))

FTAG_abs_rel_df <- cbind(frec_abs_FTAG_df,frec_relativa_FTAG_df$Freq)
names(FTAG_abs_rel_df)[1]<-"#Goles" 
names(FTAG_abs_rel_df)[2]<-"Frecuencia Absoluta";
names(FTAG_abs_rel_df)[3]<-"Frecuencia Relativa"  



