test_that("tabla_resumen_temperatura devuelve un data frame", {
  tabla <- tabla_resumen_temperatura(estaciones_ejemplo)

  expect_s3_class(tabla, "data.frame")
})

test_that("tiene una fila por estadistico y una columna por estacion", {
  tabla <- tabla_resumen_temperatura(estaciones_ejemplo)

  expect_equal(tabla$estadistico, c("promedio", "desvio"))
  expect_equal(names(tabla), c("estadistico", "NH0472", "NH0910"))
})

test_that("el promedio coincide con mean()", {
  tabla <- tabla_resumen_temperatura(estaciones_ejemplo)
  nh0472 <- estaciones_ejemplo[estaciones_ejemplo$id == "NH0472", ]

  promedio <- mean(nh0472$temperatura_abrigo_150cm, na.rm = TRUE)
  expect_equal(tabla$NH0472[1], promedio)
})

test_that("tabla_resumen_temperatura da error si datos no es data frame", {
  expect_error(tabla_resumen_temperatura("hola"), "data.frame")
  expect_error(tabla_resumen_temperatura(1:10), "data.frame")
})

test_that("tabla_resumen_temperatura da error si faltan columnas", {
  datos_sin_temp <- data.frame(id = c("A", "B"))
  expect_error(tabla_resumen_temperatura(datos_sin_temp), "temperatura_abrigo_150cm")
})
