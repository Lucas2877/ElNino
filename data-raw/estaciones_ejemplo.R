## Código para preparar el dataset `estaciones_ejemplo`
## Este script se corre una sola vez. No forma parte del paquete instalado.

library(dplyr)
library(readr)

url_base <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/"

# Lee las dos estaciones
nh0472 <- read_csv(paste0(url_base, "NH0472.csv"))
nh0910 <- read_csv(paste0(url_base, "NH0910.csv"))

# Las unimos una debajo de la otra, nos quedamos con 2015 y 2016
# y solo con las columnas que usan las funciones del paquete
estaciones_ejemplo <- rbind(nh0472, nh0910) |>
  filter(fecha >= as.Date("2015-01-01"), fecha <= as.Date("2016-12-31")) |>
  select(
    id,
    fecha,
    temperatura_abrigo_150cm,
    temperatura_abrigo_150cm_maxima,
    temperatura_abrigo_150cm_minima,
    precipitacion_pluviometrica,
    humedad_media_8_14_20
  )

# Guarda el dataset en data/estaciones_ejemplo.rda
usethis::use_data(estaciones_ejemplo, overwrite = TRUE)
