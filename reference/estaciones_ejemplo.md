# Datos de ejemplo de dos estaciones meteorológicas

Subconjunto de los datos de las estaciones NH0472 y NH0910 para los años
2015 y 2016. Sirve para probar las funciones del paquete sin necesidad
de descargar nada.

## Usage

``` r
estaciones_ejemplo
```

## Format

Un data frame (tibble) con 1462 filas y 7 columnas:

- id:

  Código de la estación.

- fecha:

  Fecha de la medición.

- temperatura_abrigo_150cm:

  Temperatura media del aire a 150 cm del suelo (°C).

- temperatura_abrigo_150cm_maxima:

  Temperatura máxima del día (°C).

- temperatura_abrigo_150cm_minima:

  Temperatura mínima del día (°C).

- precipitacion_pluviometrica:

  Lluvia del día (mm).

- humedad_media_8_14_20:

  Humedad relativa media del día (%).

## Source

<https://github.com/rse-r/intro-programacion/tree/main/datos>
