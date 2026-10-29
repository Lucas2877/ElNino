#' Leer los datos de una estación meteorológica
#'
#' Descarga el archivo CSV de una estación desde el repositorio de la materia
#' y lo lee con `readr::read_csv()`. Necesita conexión a internet.
#'
#' @param id Texto con el código de la estación, por ejemplo `"NH0472"`.
#' @param ruta Ruta donde se guarda el archivo descargado. Si no se indica,
#'   se guarda en un archivo temporal.
#'
#' @return Un data frame (tibble) con los datos de la estación.
#' @export
#'
#' @examples
#' \dontrun{
#' # Descarga la estación NH0472 en un archivo temporal
#' nh0472 <- leer_estacion("NH0472")
#'
#' # También se puede elegir dónde guardar el archivo
#' nh0910 <- leer_estacion("NH0910", ruta = "datos/NH0910.csv")
#' }
leer_estacion <- function(id, ruta = tempfile(fileext = ".csv")) {
  # El id tiene que ser un solo texto
  if (!is.character(id) || length(id) != 1) {
    stop("El id tiene que ser un texto, por ejemplo \"NH0472\".")
  }

  # La ruta también tiene que ser un solo texto
  if (!is.character(ruta) || length(ruta) != 1) {
    stop("La ruta tiene que ser un texto con el nombre del archivo.")
  }

  # Armamos la URL con el id de la estación
  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id, ".csv"
  )

  # Descargamos el archivo. Si falla, mostramos un error claro
  tryCatch(
    utils::download.file(url = url, destfile = ruta, quiet = TRUE),
    error = function(e) {
      stop("No se pudo descargar la estacion ", id,
           ". Revisa que el id exista y que tengas internet.", call. = FALSE)
    },
    warning = function(w) {
      stop("No se pudo descargar la estacion ", id,
           ". Revisa que el id exista y que tengas internet.", call. = FALSE)
    }
  )

  # Leemos el archivo descargado
  datos <- readr::read_csv(ruta, show_col_types = FALSE)

  return(datos)
}
