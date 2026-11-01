#' Gráfico de la temperatura media mensual
#'
#' Calcula la temperatura media de cada mes (1 a 12) para cada estación y la
#' grafica con una línea por estación.
#'
#' @param datos Un data frame con los datos de una o más estaciones. Tiene que
#'   tener las columnas `id`, `fecha` y `temperatura_abrigo_150cm`.
#' @param colores Vector con un color por estación. Si es `NULL` (por defecto)
#'   se eligen colores al azar.
#' @param titulo Texto con el título del gráfico.
#'
#' @return Un gráfico de ggplot2.
#' @export
#'
#' @examples
#' grafico_temperatura_mensual(estaciones_ejemplo)
#'
#' grafico_temperatura_mensual(
#'   estaciones_ejemplo,
#'   colores = c("red", "blue"),
#'   titulo = "Temperatura mensual"
#' )
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {
  # Validamos que datos sea un data frame
  if (!is.data.frame(datos)) {
    stop("'datos' tiene que ser un data.frame.")
  }

  # Validamos que estén las columnas que usamos
  columnas <- c("id", "fecha", "temperatura_abrigo_150cm")
  faltantes <- columnas[!columnas %in% names(datos)]
  if (length(faltantes) > 0) {
    stop("A 'datos' le faltan las columnas: ", paste(faltantes, collapse = ", "))
  }

  # Validamos que el título sea un texto
  if (!is.character(titulo)) {
    stop("El titulo tiene que ser un texto.")
  }

  # Contamos cuántas estaciones distintas hay
  cantidad_estaciones <- length(unique(datos$id))

  # Si no hay colores, elegimos uno al azar para cada estación
  if (is.null(colores)) {
    colores <- sample(grDevices::colors(), cantidad_estaciones)
  }

  # Tiene que haber al menos un color por estación
  if (length(colores) < cantidad_estaciones) {
    stop("Hay ", cantidad_estaciones, " estaciones pero solo ",
         length(colores), " colores.")
  }

  # Temperatura media por estación y por mes
  temperatura_mes <- datos |>
    dplyr::mutate(mes = lubridate::month(.data$fecha)) |>
    dplyr::group_by(.data$id, .data$mes) |>
    dplyr::summarise(
      temperatura_media = mean(.data$temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # Armamos el gráfico: una línea por estación.
  # En "Estación", la ó se escribe como \u00f3 porque R CMD check
  # no acepta tildes directamente en los textos del código
  grafico <- ggplot2::ggplot(
    temperatura_mes,
    ggplot2::aes(x = .data$mes, y = .data$temperatura_media, color = .data$id)
  ) +
    ggplot2::geom_line() +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::scale_x_continuous(breaks = 1:12) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura media",
      color = "Estaci\u00f3n"
    )

  return(grafico)
}
