
test_that("precipitacion_mensual devuelve un data frame con las columnas correctas", {
  precip <- precipitacion_mensual(estaciones_ejemplo)

  expect_s3_class(precip, "data.frame")
  expect_equal(names(precip), c("id", "mes", "precip_acumulada_mensual"))
})

test_that("hay 24 meses por estacion (2015 y 2016)", {
  precip <- precipitacion_mensual(estaciones_ejemplo)

  expect_equal(nrow(precip), 48)
})

test_that("la suma de un mes es correcta", {
  datos <- data.frame(
    id = "A",
    fecha = as.Date(c("2020-01-01", "2020-01-15", "2020-02-01")),
    precipitacion_pluviometrica = c(10, 5, NA)
  )
  precip <- precipitacion_mensual(datos)

  expect_equal(precip$precip_acumulada_mensual, c(15, 0))
})

test_that("precipitacion_mensual da error con datos incorrectos", {
  expect_error(precipitacion_mensual(list(a = 1)), "data.frame")
  expect_error(precipitacion_mensual(data.frame(id = "A")), "precipitacion_pluviometrica")
})
