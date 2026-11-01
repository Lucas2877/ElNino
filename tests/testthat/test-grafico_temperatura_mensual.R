test_that("grafico_temperatura_mensual devuelve un ggplot", {
  grafico <- grafico_temperatura_mensual(estaciones_ejemplo)

  expect_s3_class(grafico, "ggplot")
})

test_that("se puede elegir el titulo y los colores", {
  grafico <- grafico_temperatura_mensual(
    estaciones_ejemplo,
    colores = c("red", "blue"),
    titulo = "Mi titulo"
  )

  expect_equal(grafico$labels$title, "Mi titulo")
})

test_that("con la misma semilla salen los mismos colores al azar", {
  set.seed(123)
  grafico1 <- grafico_temperatura_mensual(estaciones_ejemplo)
  set.seed(123)
  grafico2 <- grafico_temperatura_mensual(estaciones_ejemplo)

  # Comparamos los colores que se usaron en los dos graficos
  colores1 <- ggplot2::layer_data(grafico1)$colour
  colores2 <- ggplot2::layer_data(grafico2)$colour
  expect_equal(colores1, colores2)
})

test_that("los datos del grafico tienen 12 meses por estacion", {
  grafico <- grafico_temperatura_mensual(estaciones_ejemplo)

  expect_equal(nrow(grafico$data), 24)
  expect_equal(sort(unique(grafico$data$mes)), 1:12)
})

test_that("grafico_temperatura_mensual da error con datos incorrectos", {
  expect_error(grafico_temperatura_mensual("hola"), "data.frame")
  expect_error(grafico_temperatura_mensual(data.frame(id = "A")), "faltan")
})

test_that("da error si hay menos colores que estaciones", {
  expect_error(
    grafico_temperatura_mensual(estaciones_ejemplo, colores = "red"),
    "colores"
  )
})

test_that("da error si el titulo no es texto", {
  expect_error(grafico_temperatura_mensual(estaciones_ejemplo, titulo = 1), "titulo")
})
