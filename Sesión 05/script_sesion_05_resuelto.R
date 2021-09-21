# Librerias
library(tidyverse)
library(haven)
library(sjmisc)
library(sjlabelled)

datos <- readRDS("datos_enoe.rds")

# Obtenga la media condicional del salario por hora condicionado al sexo:

datos %>%
  group_by(sex) %>%
  summarise(sal_prom = mean(ing_x_hrs))

tapply(datos$ing_x_hrs, datos$sex, mean)
get_labels(datos$sex)

# Obtenga la media condicional del salario por hora condicionado por numero de hijos:
tapply(datos$ing_x_hrs, datos$n_hij, mean)
get_labels(datos$n_hij)

frq(datos$n_hij)

# Obtenga el promedio de años de escolaridad condicionado a urbano o rural
tapply(datos$anios_esc, datos$ur, mean)
get_labels(datos$ur)

# Obtenga el ingreso mensual promedio condicionado a las horas de ocupación. Tiene sentido?
tapply(datos$ingocup, datos$hrsocup, mean)
get_labels(datos$ur)
cor(datos$ingocup, datos$hrsocup,
    method = "spearman")
?cor
plot(datos$ingocup, datos$hrsocup)

# Obtenga el numero promedio de hijos condicionado al grado promedio de escolaridad
tapply(datos$n_hij, datos$cs_p13_1, median)
get_label(datos$cs_p13_1)
get_labels(datos$cs_p13_1)

# Obtenga la correlación entre las horas ocupadas y el ingreso mensual
cor(datos$hrsocup, datos$ingocup)

# Obtenga la correlacion entre el numero de hijos y el ingreso mensual
cor(datos$n_hij,
    datos$ingocup,
    use = "complete.obs")

# Obtenga la correlación entre el grado aprobado y el numero de hijos
cor(datos$cs_p13_1,
    datos$n_hij,
    use = "complete.obs")
plot(datos$cs_p13_1,
     datos$n_hij)

datos %>%
  ggplot(aes(x = cs_p13_1, y = n_hij)) +
  geom_point() +
  geom_smooth(method = "lm")

