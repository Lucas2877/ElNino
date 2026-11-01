# Leer los datos de una estación meteorológica

Descarga el archivo CSV de una estación desde el repositorio de la
materia y lo lee con
[`readr::read_csv()`](https://readr.tidyverse.org/reference/read_delim.html).
Necesita conexión a internet.

## Usage

``` r
leer_estacion(id, ruta = tempfile(fileext = ".csv"))
```

## Arguments

- id:

  Texto con el código de la estación, por ejemplo `"NH0472"`.

- ruta:

  Ruta donde se guarda el archivo descargado. Si no se indica, se guarda
  en un archivo temporal.

## Value

Un data frame (tibble) con los datos de la estación.

## Examples

``` r
if (FALSE) { # \dontrun{
# Descarga la estación NH0472 en un archivo temporal
nh0472 <- leer_estacion("NH0472")

# También se puede elegir dónde guardar el archivo
nh0910 <- leer_estacion("NH0910", ruta = "datos/NH0910.csv")
} # }
```
