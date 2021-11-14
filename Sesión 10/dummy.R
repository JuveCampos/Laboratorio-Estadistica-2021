# Librerias:
library(tidyverse)

# 3 ejemplos vistos en clase:

# 1) La altura de la población distribuye con una distribución N(1.7, 0.3)


# Ejemplo 01 --------------------------------------------------------------

altura <- rnorm(100000,
                mean = 1.7,
                sd = 0.3)

datos = tibble(altura)

promedio = mean(datos$altura)

datos %>%
  ggplot(aes(x = altura)) +
  geom_density() +
  geom_vline(xintercept = promedio, color = "red") +
  labs(y = "Densidad",
       x = "Altura")

# ¿Cual es el porcentaje de personas que mide menos de 2 metros?

pnorm(q = 2,
      mean = 1.7,
      sd = 0.3)

# El 84.13% de la población mide hasta 2 metros
datos %>%
  ggplot(aes(x = altura)) +
  geom_density() +
  geom_vline(xintercept = 2, color = "red")

# ¿Cuanto mide el 80% más bajito de la población?
qnorm(p = 0.8,
      mean = 1.7,
      sd = 0.3)

datos %>%
  ggplot(aes(x = altura)) +
  geom_density() +
  geom_vline(xintercept = 1.95, color = "red")

# ¿Cuantas personas miden entre 1.5 y 2 m?
pnorm(q = 2,
      mean = 1.7,
      sd = 0.3) - pnorm(q = 1.5,
      mean = 1.7,
      sd = 0.3)








