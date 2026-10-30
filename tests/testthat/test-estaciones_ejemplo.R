test_that("estaciones_ejemplo tiene las columnas esperadas", {
  columnas <- c("id", "fecha", "temperatura_abrigo_150cm",
                "precipitacion_pluviometrica")

  expect_s3_class(estaciones_ejemplo, "data.frame")
  expect_true(all(columnas %in% names(estaciones_ejemplo)))
})

test_that("estaciones_ejemplo tiene dos estaciones", {
  expect_equal(sort(unique(estaciones_ejemplo$id)), c("NH0472", "NH0910"))
})

test_that("la columna fecha es de tipo fecha", {
  expect_s3_class(estaciones_ejemplo$fecha, "Date")
})
