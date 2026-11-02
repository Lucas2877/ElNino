# Script para crear el logo del paquete (un sol y una ola) con hexSticker.
# Se corre una sola vez; está en data-raw/ para que no entre en el paquete.
library(ggplot2)
library(hexSticker)

# Sol: un círculo armado con cos() y sin()
angulo <- seq(0, 2 * pi, length.out = 100)
sol <- data.frame(x = 2 + 0.9 * cos(angulo), y = 1.5 + 0.9 * sin(angulo))

# Olas: dos curvas seno, una clara adelante y una oscura más abajo
x <- seq(0, 4, length.out = 200)
ola_clara <- data.frame(x = x, y = 0.3 * sin(x * pi))
ola_oscura <- data.frame(x = x, y = -0.5 + 0.3 * sin(x * pi + 1))

dibujo <- ggplot() +
  geom_polygon(data = sol, aes(x = x, y = y), fill = "#FFB300") +
  geom_ribbon(data = ola_clara, aes(x = x, ymin = -1.5, ymax = y), fill = "#42A5F5") +
  geom_ribbon(data = ola_oscura, aes(x = x, ymin = -1.5, ymax = y), fill = "#1565C0") +
  coord_fixed() +
  theme_void() +
  theme_transparent()

# Armamos el hexágono: nombre arriba, dibujo abajo
sticker(
  dibujo,
  package = "ElNino",
  p_size = 20, p_y = 1.45, p_color = "#0D47A1",
  s_x = 1, s_y = 0.8, s_width = 1.3, s_height = 1,
  h_fill = "#E3F2FD", h_color = "#0D47A1",
  filename = "data-raw/logo.png"
)

# Copia el logo a man/figures/logo.png con el tamaño justo
usethis::use_logo("data-raw/logo.png")
