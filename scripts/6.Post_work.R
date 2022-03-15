
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
