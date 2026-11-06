skip_si_no_hay_internet <- function() {
  skip_if_not_installed("curl")
  skip_if_not(curl::has_internet(), "No hay conexión a internet")
}
