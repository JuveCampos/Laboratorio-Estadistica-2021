# Autor:  -----------------------------------------------------------------
# Jorge Juvenal Campos Ferreira.
# 31 de agosto, 2021.
# Laboratorio 02 - Estadística

# Archivos ----------------------------------------------------------------
# Tutorial del año pasado: https://rpubs.com/Juve_Campos/labeledData

# Opciones ----------------------------------------------------------------
options(scipen = 999)

# Librerias ---------------------------------------------------------------
pacman::p_load(haven, tidyverse, sjmisc, sjlabelled)
# library(haven)       # Abrir formatos extranjeros
# library(tidyverse)   # Manejo tidy de los datos
# library(sjmisc)      # Manejo de información etiquetada
# library(sjlabelled)  # Manejo de etiquetas

# Locales -----------------------------------------------------------------
# importantísimo para manejar caracteres latinos y nombres en español (para Mac):
Sys.setlocale("LC_ALL", "es_ES.UTF-8")         # MAC
# Para windows (quitar # para habilitarlo):
Sys.setlocale("LC_ALL", "Spanish_Mexico.1252") # WINDOWS

# Datos -------------------------------------------------------------------
# Origen de los datos:
# http://datasets.americasbarometer.org/database/index.php?freeUser=true

# Diccionario de variables:
# Siempre que leamos una encuesta, tenemos que tener a la mano el diccionario de variables.
# http://datasets.americasbarometer.org/database/files/Mexico%20LAPOP%20AmericasBarometer%202019_Codebook_v1.0_W.pdf

# Leemos los datos:
lapop <- read_dta("01_Datos/lapop_2018_ejercicio")

# Paso 0: Exploramos los datos:
head(lapop)
glimpse(lapop)
names(lapop)
get_label(lapop)

# Ejercicios:  ------------------------------------------------------------

# 1) Abre con View() la base de datos lapop.
View(lapop) # Lo mismo que picarle al objeto lapop del ambiente.

# 2) Muestra las etiquetas de las variables con la función get_label() y get_labels()
get_label(lapop)  # Muestra las etiquetas de la variable
get_labels(lapop) # Muestra las etiquetas de los valores de la variable

# 3) ¿Cual es la etiqueta de la variable vb2? ¿A qué pregunta del cuestionario hace referencia?
get_label(lapop$vb2)
# R: "Votó en las últimas elecciones presidenciales"

# 4) De la pregunta vb2, ¿qué significan las claves de las respuestas?
get_values(lapop$vb2)
get_labels(lapop$vb2)

# 5) ¿Cuantos valores hay de cada uno en la encuesta?
table(lapop$vb2)
flat_table(lapop$vb2)

# 5) ¿Cual es la pregunta de la variable ed? ¿Qué significa cada clave? ¿Por qué es un caso especial?
get_label(lapop$ed)
get_labels(lapop$ed)
get_values(lapop$ed)
class(lapop$ed)
mean(lapop$ed, na.rm = T)
sd(lapop$ed, na.rm = T)
summary(lapop$ed, na.rm = T)ç
lapop %>%
  ggplot(aes(x = ed)) +
  geom_density()

# 6) Elabore una tabla de frecuencias para la pregunta q5a
get_label(lapop$q5a)
table(lapop$q5a)
flat_table(lapop$q5a)

# 7) Elabore una tabla cruzada para la variable vb2 y la variable vb10
get_label(lapop$vb2)
get_labels(lapop$vb2)
get_label(lapop$vb10)
get_labels(lapop$vb10)
table(lapop$vb2, lapop$vb10)
flat_table(lapop,vb2,vb10)

# 8) Elabore una tabla cruzada de la variable b47a y de la variable vb10
get_label(lapop$b47a)
get_label(lapop$vb10)
table(lapop$b47a, lapop$vb10)
flat_table(lapop, vb10, b47a)


# 9) Con la tabla del paso anterior, haga una tabla cruzada con proporciones a nivel fila y columna. Exprese que significan.
flat_table(lapop, vb10, b47a, margin = "row")
flat_table(lapop, vb10, b47a, margin = "col")

# 10) Genere una variable de grupo de edad (grupo_edad) recodificando la variable de edad (q2) para agrupar a los respondientes en tres grupos:
# [18-29 años], [30-49 años], [50-70 años] y [Mayores de 71 años]

g_edad <- lapop %>%
  transmute(grupo_edad = rec(q2,
                          rec = c("min:29=1 [18-29 años]; 30:49=2 [30-49 años]; 50:70 = 3 [50-70 años]; 71:max = 4 [Mayores de 71 años]"),
                          var.label = "Grupo de edad",
                          as.num = FALSE))

g_edad$grupo_edad
get_label(g_edad$grupo_edad)
get_labels(g_edad$grupo_edad)
get_values(g_edad$grupo_edad)

lapop <- lapop %>%
  mutate(grupo_edad = rec(q2,
                             rec = c("min:29=1 [18-29 años]; 30:49=2 [30-49 años]; 50:70 = 3 [50-70 años]; 71:max = 4 [Mayores de 71 años]"),
                             var.label = "Grupo de edad",
                             as.num = FALSE))

# 11) Genere una tabla cruzada, con proporciones por grupo de edad, para la variable vb2.
flat_table(lapop, grupo_edad, vb2, margin = "row")


