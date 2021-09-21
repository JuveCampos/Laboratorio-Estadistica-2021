library(tidyverse)
library(haven)

bd <- read_sav("ENOEN_SDEMT121.sav")

datos <- bd %>%
  select(loc, mun, ent, con, n_pro_viv, v_sel, n_hog, ur,
         sex, eda, e_con, clase1,
         cs_p13_1, n_hij, ing_x_hrs, ingocup, hrsocup, anios_esc, imssissste
         )

saveRDS(datos, "datos_enoe.rds")

datos <- readRDS("datos_enoe.rds")

# Obtenga la media condicional del salario por hora condicionado al sexo:
tapply(datos$ing_x_hrs, datos$sex, mean)
get_labels(datos$sex)

# Obtenga la media condicional del salario por hora condicionado por numero de hijos:
tapply(datos$ing_x_hrs, datos$n_hij, mean)
get_labels(datos$n_hij)

# Obtenga el promedio de años de escolaridad condicionado a urbano o rural
tapply(datos$anios_esc, datos$ur, mean)
get_labels(datos$ur)

# Obtenga el ingreso mensual promedio condicionado a las horas de ocupación. Tiene sentido?
tapply(datos$hrsocup, datos$ingocup, mean)
get_label(datos$ingocup)

# Obtenga el numero promedio de hijos condicionado al grado promedio de escolaridad
tapply(datos$n_hij, datos$cs_p13_1, mean, na.rm = T)
get_labels(datos$cs_p13_1)

# Obtenga la correlación entre las horas ocupadas y el ingreso mensual
cor(datos$hrsocup, datos$ingocup)
plot(datos$hrsocup, datos$ingocup)

# Obtenga la correlacion entre el numero de hijos y el ingreso mensual
cor(datos$ingocup, datos$n_hij, use = "complete.obs")
plot(datos$ingocup, datos$n_hij)

# Obtenga la correlación entre el grado aprobado y el numero de hijos
cor(datos$cs_p13_1, datos$n_hij, use = "complete.obs")
plot(datos$cs_p13_1, datos$n_hij)



