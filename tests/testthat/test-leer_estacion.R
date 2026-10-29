test_that("leer_estacion da error si el id no es texto", {
  expect_error(leer_estacion(472), "texto")
  expect_error(leer_estacion(c("NH0472", "NH0910")), "texto")
})

test_that("leer_estacion da error si la ruta no es texto", {
  expect_error(leer_estacion("NH0472", ruta = 123), "ruta")
})

test_that("leer_estacion descarga una estacion", {
  # Este test necesita internet, si no hay se saltea
  skip_if_offline()

  datos <- leer_estacion("NH0472")

  expect_s3_class(datos, "data.frame")
  expect_true("temperatura_abrigo_150cm" %in% names(datos))
  expect_equal(unique(datos$id), "NH0472")
})

test_that("leer_estacion da error si la estacion no existe", {
  skip_if_offline()

  expect_error(leer_estacion("NO_EXISTE"), "No se pudo descargar")
})
