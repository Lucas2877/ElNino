# Precipitación acumulada por mes

Suma la precipitación de todos los días de cada mes para cada estación.
Los valores faltantes (`NA`) no se tienen en cuenta en la suma.

## Usage

``` r
precipitacion_mensual(datos)
```

## Arguments

- datos:

  Un data frame con los datos de una o más estaciones. Tiene que tener
  las columnas `id`, `fecha` y `precipitacion_pluviometrica`.

## Value

Un data frame (tibble) con las columnas `id`, `mes` (el primer día de
cada mes) y `precip_acumulada_mensual` (en mm).

## Examples

``` r
precipitacion_mensual(estaciones_ejemplo)
#> # A tibble: 48 × 3
#>    id     mes        precip_acumulada_mensual
#>    <chr>  <date>                        <dbl>
#>  1 NH0472 2015-01-01                    221  
#>  2 NH0472 2015-02-01                     99  
#>  3 NH0472 2015-03-01                    125. 
#>  4 NH0472 2015-04-01                     66.6
#>  5 NH0472 2015-05-01                    156  
#>  6 NH0472 2015-06-01                     69.5
#>  7 NH0472 2015-07-01                     41  
#>  8 NH0472 2015-08-01                    121. 
#>  9 NH0472 2015-09-01                     23  
#> 10 NH0472 2015-10-01                     72.3
#> # ℹ 38 more rows
```
