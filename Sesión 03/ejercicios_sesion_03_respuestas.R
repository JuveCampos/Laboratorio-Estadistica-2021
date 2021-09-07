# Autor:  -----------------------------------------------------------------
# Jorge Juvenal Campos Ferreira.
# 31 de agosto, 2021.
# Laboratorio 02 - Estadística

# Librerias: ----
# ¿Para qué sirve cada una de estas? :
library(haven)
library(tidyverse)
library(sjmisc)
library(sjlabelled)

# Base de datos: ----
bd <- read_stata("lapop_2018_ejercicio.dta")
# ¿Que hago en este paso?:
labels <- tibble(label = get_label(bd) %>% as_tibble(),
                 variable = names(bd))

# EJERCICIOS: ----

#	1	)	Genera una nueva variable a partir de recodificar la variable l1, que tenga solo tres categorias. 	----
bd$l1

bd <- bd %>%
  mutate(grado_ideologia = rec(l1,
                               rec = "1:3= -1 [Izquierda];
                               4:7= 0 [Centro];
                               8:1 s0= 1 [Derecha];",
                               var.label = "Grado de Ideología",
                               as.num = TRUE))

bd$grado_ideologia
class(bd$grado_ideologia)

#	2	)	Obten la media de la nueva variable	----
mean(bd$grado_ideologia, na.rm = T)

#	3	)	Genera una tabla de contingencia donde cruces la nueva variable con la variable prov	----

bd %>%
  flat_table(prov, grado_ideologia, margin = "row")

#	4	)	Genera una tabla de contingencia donde cruces la nueva variable con la variable vb2	----
get_label(bd$vb2)

bd %>%
  flat_table(vb2, grado_ideologia, margin = "col") %>%
  as_tibble()

#	5	)	¿Qué tipo de variable es la variable ed? ¿Qué información guarda? 	----
class(bd$ed)
get_label(bd$ed)
bd$ed

#	6	)	Obten la media, la mediana, la frecuencia y los cuartiles de la variable ed. 	----
mean(bd$ed, na.rm = T)
median(bd$ed, na.rm = T)
frq(bd$ed)
bd %>%
  group_by(ed) %>%
  count()
quantile(bd$ed, na.rm = T)
summary(bd$ed)

#	7	)	Obten la gráfica de la distribución de la variable ed	----
plot(density(bd$ed, na.rm = T))
bd %>%
  ggplot(aes(x = ed)) +
  geom_density() +
  labs(title = "Densidad de educación")

#	8	)	Obten la gráfica de cajas de la variable ed	----
boxplot(bd$ed)
bd %>%
  ggplot(aes(y = ed)) +
  geom_boxplot() +
  labs(title = "Densidad de educación")

#	9	)	La variable ed tiene algún tipo de sesgo? 	----
mean(bd$ed, na.rm = T)
median(bd$ed, na.rm = T)

#	10	)	Obten la tabla de frecuencias de la variable vb3n	----
frq(bd$vb3n)

#	11	)	Genera una gráfica de barras con los valores de la variable vb3n	----
bd$vb3n %>%
  flat_table() %>%
  as_tibble() %>%
  ggplot(aes(x = reorder(x, Freq), y = Freq)) +
  geom_col() +
  coord_flip()

#	12	)	Obten la tabla de frecuencias de la variable q5a	----
frq(bd$q5a)

#	13	)	Obten las estadísticas de la variable q5a. 	----
summary(bd$q5a)



