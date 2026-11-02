
<!-- README.md se genera a partir de README.Rmd. Editá este archivo. -->

# ElNino <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/Lucas2877/ElNino/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Lucas2877/ElNino/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

ElNino es un paquete de R para leer y analizar datos de estaciones
meteorológicas. Permite descargar los datos de una estación, hacer una
tabla resumen de la temperatura, calcular la precipitación de cada mes y
graficar la temperatura media mensual.

> **Aclaración:** este es un paquete de prueba que hicimos para el
> parcial de la materia de programación en R. No está pensado para
> usarse en trabajos reales.

**¿Por qué ElNino?** El nombre viene de El Niño, el fenómeno climático
que calienta el océano Pacífico y cambia las lluvias y temperaturas en
Argentina. Lo escribimos sin “ñ” porque los nombres de paquetes de R
solo aceptan letras sin tilde.

## Instalación

Podés instalar el paquete desde GitHub con `pak`:

``` r
# install.packages("pak")
pak::pak("Lucas2877/ElNino")
```

o con `remotes`:

``` r
# install.packages("remotes")
remotes::install_github("Lucas2877/ElNino")
```

## Empezar rápido

El paquete trae el dataset `estaciones_ejemplo`, con datos de dos
estaciones (NH0472 y NH0910) para 2015 y 2016, así se puede probar todo
sin internet.

``` r
library(ElNino)

# Promedio y desvío de la temperatura de cada estación
tabla_resumen_temperatura(estaciones_ejemplo)
#> # A tibble: 2 × 3
#>   estadistico NH0472 NH0910
#>   <chr>        <dbl>  <dbl>
#> 1 promedio     19.1   18.2 
#> 2 desvio        5.74   6.09

# Precipitación acumulada de cada mes
head(precipitacion_mensual(estaciones_ejemplo))
#> # A tibble: 6 × 3
#>   id     mes        precip_acumulada_mensual
#>   <chr>  <date>                        <dbl>
#> 1 NH0472 2015-01-01                    221  
#> 2 NH0472 2015-02-01                     99  
#> 3 NH0472 2015-03-01                    125. 
#> 4 NH0472 2015-04-01                     66.6
#> 5 NH0472 2015-05-01                    156  
#> 6 NH0472 2015-06-01                     69.5
```

``` r
# Temperatura media de cada mes
grafico_temperatura_mensual(estaciones_ejemplo, colores = c("darkorange", "steelblue"))
```

<img src="man/figures/README-grafico-1.png" alt="" width="100%" />

Para descargar los datos completos de una estación (necesita internet):

``` r
nh0472 <- leer_estacion("NH0472")
```

En la viñeta `vignette("ElNino")` hay un ejemplo más completo.

## Autores

- Lucas Bruno ([@Lucas2877](https://github.com/Lucas2877)) – mantenedor
- Valentino Ricci
  ([@VALENTINO16-HUB](https://github.com/VALENTINO16-HUB))
- Lucas Boveri ([@LucasBoveri](https://github.com/LucasBoveri))

## Código de conducta

Este proyecto tiene un [Código de Conducta](CODE_OF_CONDUCT.md). Al
participar aceptás respetarlo.
