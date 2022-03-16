getwd()
setwd("C:/Proyecto_entregable_programación_y_estadistica_con_r/data")
url_data <- "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-2021/main/Sesion-07/Postwork/data.csv"
download.file(url = url_match, destfile = "data_p7.csv",mode = "w" )
datos_p7 <- data.frame(read.csv("match_data.csv"))
write.csv(datos_p7, "match_data.csv", row.names = F)
mtcars

mtcars_df <- data.frame(mtcars)

write.csv(mtcars_df, "mtcars.csv", row.names = F)
