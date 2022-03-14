library(tidyverse)
library(dplyr)
library(ggplot2)
#Fijar Ruta para obtener datos
setwd("E:/Bedu/project_in_r/data")
getwd()
datos_soccer_19_22<- read.csv("season_20192022.csv")
View(datos_soccer_19_22)

goles_casa_visita <- data.frame(datos_soccer_19_22$FTHG, datos_soccer_19_22$FTAG)
names(goles_casa_visita)[1]<-"FTHG" ;names(goles_casa_visita)[2]<-"FTAG"

#####################################################
#Frecuencias abs de FTHG 
(frec_abs_FTHG <- table(goles_casa_visita$FTHG))
(frec_abs_FTHG_df <- data.frame(frec_abs_FTHG))

#Frecuencia Marginal de FTHG
(frec_relativa_FTHG <- prop.table(frec_abs_FTHG))
(frec_relativa_FTHG_df <- data.frame(frec_relativa_FTHG))
(goles <-data.frame(0:6))
FTHG_abs_rel_df <- cbind(goles,frec_abs_FTHG_df$Freq,
                         frec_relativa_FTHG_df$Freq*100
                         ,round(frec_relativa_FTHG_df$Freq*100,2))
names(FTHG_abs_rel_df)[1]<-"Goles"
names(FTHG_abs_rel_df)[2]<-"Frecuencia Absoluta";
names(FTHG_abs_rel_df)[3]<-"Frecuencias_Relativa"
names(FTHG_abs_rel_df)[4]<-"Probabilidad Marginal"
##########################################################
#Frecuencia abs de FTAG
(frec_abs_FTAG <- table(goles_casa_visita$FTAG))
frec_abs_FTAG_df<-data.frame(frec_abs_FTAG)
#Frecuencia Marginal de FTHG
(frec_relativa_FTAG<- prop.table(frec_abs_FTAG))
(frec_relativa_FTAG_df <- data.frame(frec_relativa_FTAG))
FTAG_abs_rel_df <- cbind(goles,frec_abs_FTAG_df$Freq,
                         frec_relativa_FTAG_df$Freq*100,
                         round(frec_relativa_FTAG_df$Freq*100, 2) )
names(FTAG_abs_rel_df)[1]<-"Goles"
names(FTAG_abs_rel_df)[2]<-"Frecuencia Absoluta";
names(FTAG_abs_rel_df)[3]<-"Frecuencias_Relativa"
names(FTAG_abs_rel_df)[4]<-"Probabilidad Marginal"
########################################################
cont_signo <- c()
for (i in 1:length(FTAG_abs_rel_df$`Frecuencias Relativa`)) {
  cont_signo[i]<-"%"
}
cont_signo
FTHG_abs_rel_df <- cbind(FTHG_abs_rel_df,cont_signo)
FTAG_abs_rel_df <- cbind(FTAG_abs_rel_df,cont_signo)

FTAG_abs_rel_df <- unite(FTAG_abs_rel_df, col="",
                         c("Probabilidad Marginal","cont_signo"), sep="")
FTHG_abs_rel_df <- unite(FTHG_abs_rel_df, col="Frecuencia Marginal",
                         c("Probabilidad Marginal","cont_signo"), sep="")

#Sacar la tupla
(min_goles <-min(FTHG_abs_rel_df$`Goles`))
(max_goles <-max(FTHG_abs_rel_df$`Goles`))

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

##Conteo de la frecuencia de los resultados esperados
vectors_resultados <-c()
cuentas <-0
for (k in 1:length(tuplas_prob_conjunta$x)) {
  #cat(tuplas_prob_conjunta$x[k]," ",tuplas_prob_conjunta$y[k],"\n")
  for (h in 1:length(goles_casa_visita$FTHG)) {
    if(tuplas_prob_conjunta$x[k]==goles_casa_visita$FTHG[h]){
      if(tuplas_prob_conjunta$y[k]==goles_casa_visita$FTAG[h]){
        cuentas <- cuentas+1
      }
    }
    vectors_resultados[k]<-cuentas
  }
  cuentas <-0
}
vectors_resultados
#Calculo de la probabilidad conjunta

(prob_conjunta<- vectors_resultados/length(goles_casa_visita$FTHG))

########
cont_signo_dos <- c()
for (i in 1:length(tuplas_prob_conjunta$x)) {
  cont_signo_dos[i]<-"%"
}
cont_signo_dos
##########
###Tabla resultados
tabla_prob_conjunta<- cbind(tuplas_prob_conjunta,vectors_resultados,
                            prob_conjunta*100, round(prob_conjunta*100,2)
                            ,cont_signo_dos)
names(tabla_prob_conjunta)[1]<-"Goles_Casa"
names(tabla_prob_conjunta)[2]<-"Goles_Visita"
names(tabla_prob_conjunta)[3]<-"Frecuencia Absoluta"
names(tabla_prob_conjunta)[4]<-"Probabilidad_Conjunta"
names(tabla_prob_conjunta)[5]<-"Probabilidad Conjunta"
names(tabla_prob_conjunta)[6]<-"Porc"

tabla_prob_conjunta<-unite(tabla_prob_conjunta,col="Probabilidad Conjunta",
                           c("Probabilidad Conjunta","Porc"), sep="" )

#######################################
FTHG_abs_rel_df
str(FTHG_abs_rel_df)
###########################################################
ggplot(FTHG_abs_rel_df,aes(Goles, y=Frecuencias_Relativa ))+
  geom_col(fill= "#008000", color ="black", width = .8)+ 
  theme_minimal()+labs(x="Número de Goles",y="Probabilidad de Goles en %", 
                       title="Relación Goles y Probabilidad Goles CASA")+
  scale_x_continuous(breaks = seq(0,max(6),1))+
  scale_y_continuous(breaks = seq(0, max(45),5 ))+  
  geom_text(aes(label=FTHG_abs_rel_df$`Frecuencia Absoluta`), 
            vjust=-0.2, color="black",
            position = position_dodge(1),
            size=4.0)


######################################################################


ggplot(FTAG_abs_rel_df,aes(Goles, y=Frecuencias_Relativa ))+
  geom_col(fill= "#008000", color ="black", width = .8)+ 
  theme_minimal()+labs(x="Número de Goles",y="Probabilidad de Goles en %", 
                       title="Relación Goles y Probabilidad Goles VISITA")+
  scale_x_continuous(breaks = seq(0,max(6),1))+
  scale_y_continuous(breaks = seq(0, max(45),5 ))+  
  geom_text(aes(label=FTAG_abs_rel_df$`Frecuencia Absoluta`), 
            vjust=-0.2, color="black",
            position = position_dodge(1),
            size=4.0)


#################################################################
ggplot(tabla_prob_conjunta, aes(x =Goles_Casa , 
                                y =Goles_Visita ,
                                fill = Probabilidad_Conjunta))+
  geom_tile()+
  scale_fill_gradient(low = "#FAFAC1", high = "#008000") +
  labs(x="Número de Goles CASA",y="Número de Goles VISITA"
       ,title="Relación Goles CASA y VISITA, con Probabilidad ")+
  scale_x_continuous(breaks = seq(0,max(6),1))+
  scale_y_continuous(breaks = seq(0, max(6),1 ))+
  theme_minimal()





