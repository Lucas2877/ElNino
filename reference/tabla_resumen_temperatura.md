# Tabla resumen de la temperatura por estación

Calcula el promedio y el desvío estándar de la temperatura de abrigo a
150 cm para cada estación. El resultado tiene los estadísticos en las
filas y las estaciones en las columnas.

## Usage

``` r
tabla_resumen_temperatura(datos)
```

## Arguments

- datos:

  Un data frame con los datos de una o más estaciones. Tiene que tener
  las columnas `id` y `temperatura_abrigo_150cm`.

## Value

Un data frame (tibble) con una columna `estadistico` (promedio y desvio)
y una columna por cada estación.

## Examples

``` r
tabla_resumen_temperatura(estaciones_ejemplo)
#> # A tibble: 2 × 3
#>   estadistico NH0472 NH0910
#>   <chr>        <dbl>  <dbl>
#> 1 promedio     19.1   18.2 
#> 2 desvio        5.74   6.09
```
