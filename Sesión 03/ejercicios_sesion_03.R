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

#	2	)	Obten la media de la nueva variable	----

#	3	)	Genera una tabla de contingencia donde cruces la nueva variable con la variable prov	----

#	4	)	Genera una tabla de contingencia donde cruces la nueva variable con la variable vb2	----

#	5	)	¿Qué tipo de variable es la variable ed? ¿Qué información guarda? 	----

#	6	)	Obten la media, la mediana, la frecuencia y los cuartiles de la variable ed. 	----

#	7	)	Obten la gráfica de la distribución de la variable ed	----

#	8	)	Obten la gráfica de cajas de la variable ed	----

#	9	)	La variable ed tiene algún tipo de sesgo? 	----

#	10	)	Obten la tabla de frecuencias de la variable vb3n	----

#	11	)	Genera una gráfica de barras con los valores de la variable vb3n	----

#	12	)	Obten la tabla de frecuencias de la variable q5a	----

#	13	)	Obten las estadísticas de la variable q5a. 	----
