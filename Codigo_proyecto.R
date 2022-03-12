library(tidyverse)
library(dplyr)
#Fijar Ruta para obtener datos
setwd("E:/Bedu/project_in_r")
getwd()

#Obtener y guardar datos
datos_soccer_20_21<- read.csv(choose.files())
View(datos_soccer_20_21)

goles_casa_visita <- data.frame(datos_soccer_20_21$FTHG, datos_soccer_20_21$FTAG)
names(goles_casa_visita)[1]<-"FTHG" ;names(goles_casa_visita)[2]<-"FTAG"

#####################################################
#Frecuencias abs de FTHG 
(frec_abs_FTHG <- table(goles_casa_visita$FTHG))
(frec_abs_FTHG_df <- data.frame(frec_abs_FTHG))

#Frecuencia Marginal de FTHG
(frec_relativa_FTHG <- prop.table(frec_abs_FTHG))
(frec_relativa_FTHG_df <- data.frame(frec_relativa_FTHG))
(goles <-data.frame(0:6))

FTHG_abs_rel_df <- cbind(goles,frec_abs_FTHG_df$Freq,frec_relativa_FTHG_df$Freq,
                         frec_relativa_FTHG_df$Freq*100)
names(FTHG_abs_rel_df)[1]<-"#Goles"
names(FTHG_abs_rel_df)[2]<-"Frecuencia Absoluta";
names(FTHG_abs_rel_df)[3]<-"Frecuencias Relativa"

################################################
#Frecuencia abs de FTAG
(frec_abs_FTAG <- table(goles_casa_visita$FTAG))
frec_abs_FTAG_df<-data.frame(frec_abs_FTAG)
#Frecuencia Marginal de FTHG
(frec_relativa_FTAG<- prop.table(frec_abs_FTAG))
(frec_relativa_FTAG_df <- data.frame(frec_relativa_FTAG))
FTAG_abs_rel_df <- cbind(goles,frec_abs_FTAG_df$Freq,frec_relativa_FTAG_df$Freq)
names(FTAG_abs_rel_df)[1]<-"#Goles"
names(FTAG_abs_rel_df)[2]<-"Frecuencia Absoluta";
names(FTAG_abs_rel_df)[3]<-"Frecuencias Relativa"

##################################
#Sacar la tupla
(min_goles <-min(FTHG_abs_rel_df$`#Goles`))
(max_goles <-max(FTHG_abs_rel_df$`#Goles`))

min_max_rango<-min_goles:max_goles
vueltas<-1
cont_uno <- c()
cont_dos <- c()

for(i in min_max_rango) {
  for (j in min_max_rango) {
    cont_uno[vueltas]<-i
    cont_dos[vueltas]<-j
    vueltas <- vueltas+1
  }
}

tuplas_prob_conjunta<-  data.frame(cont_uno, cont_dos)
names(tuplas_prob_conjunta)[1]<-"x"
names(tuplas_prob_conjunta)[2]<-"y"

#####################################################
