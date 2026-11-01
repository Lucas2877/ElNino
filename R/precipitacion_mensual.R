#' Precipitación acumulada por mes
#'
#' Suma la precipitación de todos los días de cada mes para cada estación.
#' Los valores faltantes (`NA`) no se tienen en cuenta en la suma.
#'
#' @param datos Un data frame con los datos de una o más estaciones. Tiene que
#'   tener las columnas `id`, `fecha` y `precipitacion_pluviometrica`.
#'
#' @return Un data frame (tibble) con las columnas `id`, `mes` (el primer día
#'   de cada mes) y `precip_acumulada_mensual` (en mm).
#' @export
#'
#' @examples
#' precipitacion_mensual(estaciones_ejemplo)
precipitacion_mensual <- function(datos) {
  # Validamos que datos sea un data frame
  if (!is.data.frame(datos)) {
    stop("'datos' tiene que ser un data.frame.")
  }

  # Validamos que estén las columnas que usamos
  columnas <- c("id", "fecha", "precipitacion_pluviometrica")
  faltantes <- columnas[!columnas %in% names(datos)]
  if (length(faltantes) > 0) {
    stop("A 'datos' le faltan las columnas: ", paste(faltantes, collapse = ", "))
  }

  # floor_date lleva cada fecha al primer día de su mes,
  # así podemos agrupar por mes y sumar la precipitación
  precipitacion <- datos |>
    dplyr::mutate(mes = lubridate::floor_date(.data$fecha, "month")) |>
    dplyr::group_by(.data$id, .data$mes) |>
    dplyr::summarise(
      precip_acumulada_mensual = sum(.data$precipitacion_pluviometrica, na.rm = TRUE),
      .groups = "drop"
    )

  return(precipitacion)
}
