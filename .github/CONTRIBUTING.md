# Cómo contribuir a ElNino

¡Gracias por querer ayudar! Este es un paquete que hicimos para una materia,
así que cualquier aporte es bienvenido.

## Reportar un problema

Si encontrás un error, abrí un [issue](https://github.com/Lucas2877/ElNino/issues)
contando:

- Qué código corriste (si puede ser, un ejemplo chico que reproduzca el error).
- Qué esperabas que pasara y qué pasó.

## Proponer un cambio

1. Hacé un fork del repositorio y clonalo en tu computadora.
2. Creá una rama nueva para tu cambio.
3. Si agregás o cambiás una función, actualizá su documentación roxygen y
   corré `devtools::document()`.
4. Agregá tests en `tests/testthat/` y verificá que todo pase con
   `devtools::check()`.
5. Hacé commits chicos con mensajes claros y abrí un pull request.

## Código de conducta

Al participar en este proyecto aceptás respetar el
[Código de Conducta](../CODE_OF_CONDUCT.md).
