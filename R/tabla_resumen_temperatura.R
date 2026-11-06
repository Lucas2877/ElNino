#' Tabla resumen de la temperatura por estación
#'
#' Calcula el promedio y el desvío estándar de la temperatura de abrigo a
#' 150 cm para cada estación. El resultado tiene los estadísticos en las filas
#' y las estaciones en las columnas.
#'
#' @param datos Un data frame con los datos de una o más estaciones. Tiene que
#'   tener las columnas `id` y `temperatura_abrigo_150cm`.
#'
#' @return Un data frame (tibble) con una columna `estadistico` (promedio y
#'   desvio) y una columna por cada estación.
#' @export
#'
#' @examples
#' tabla_resumen_temperatura(estaciones_ejemplo)
tabla_resumen_temperatura <- function(datos) {
  # Validamos que datos sea un data frame
  if (!is.data.frame(datos)) {
    stop("'datos' tiene que ser un data.frame.")
  }

  # Validamos que estén las columnas que usamos
  columnas <- c("id", "temperatura_abrigo_150cm")
  faltantes <- columnas[!columnas %in% names(datos)]
  if (length(faltantes) > 0) {
    stop("A 'datos' le faltan las columnas: ", paste(faltantes, collapse = ", "))
  }

  # Validamos que la temperatura sea un número
  if (!is.numeric(datos$temperatura_abrigo_150cm)) {
    stop("La columna temperatura_abrigo_150cm tiene que ser numerica.")
  }

  # Promedio y desvío de la temperatura por estación
  resumen <- datos |>
    dplyr::group_by(.data$id) |>
    dplyr::summarise(
      promedio = mean(.data$temperatura_abrigo_150cm, na.rm = TRUE),
      desvio = stats::sd(.data$temperatura_abrigo_150cm, na.rm = TRUE)
    )

  # Pasamos promedio y desvío a una sola columna (formato largo)
  resumen_largo <- resumen |>
    tidyr::pivot_longer(
      cols = c("promedio", "desvio"),
      names_to = "estadistico",
      values_to = "valor"
    )

  # Ponemos una columna por estación (formato ancho)
  resumen_ancho <- resumen_largo |>
    tidyr::pivot_wider(
      names_from = "id",
      values_from = "valor"
    )

  return(resumen_ancho)
}
