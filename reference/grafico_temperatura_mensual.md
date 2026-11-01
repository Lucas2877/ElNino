# Gráfico de la temperatura media mensual

Calcula la temperatura media de cada mes (1 a 12) para cada estación y
la grafica con una línea por estación.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Un data frame con los datos de una o más estaciones. Tiene que tener
  las columnas `id`, `fecha` y `temperatura_abrigo_150cm`.

- colores:

  Vector con un color por estación. Si es `NULL` (por defecto) se eligen
  colores al azar.

- titulo:

  Texto con el título del gráfico.

## Value

Un gráfico de ggplot2.

## Examples

``` r
grafico_temperatura_mensual(estaciones_ejemplo)


grafico_temperatura_mensual(
  estaciones_ejemplo,
  colores = c("red", "blue"),
  titulo = "Temperatura mensual"
)
```
