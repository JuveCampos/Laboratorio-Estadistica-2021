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
# Lo mismo que picarle al objeto lapop del ambiente.

# 2) Muestra las etiquetas de las variables con la función get_label() y get_labels()
  # Muestra las etiquetas de la variable
  # Muestra las etiquetas de los valores de la variable

# 3) ¿Cual es la etiqueta de la variable vb2? ¿A qué pregunta del cuestionario hace referencia?

# 4) De la pregunta vb2, ¿qué significan las claves de las respuestas?

# 5) ¿Cuantos valores hay de cada uno en la encuesta?

# 5) ¿Cual es la pregunta de la variable ed? ¿Qué significa cada clave? ¿Por qué es un caso especial?

# 6) Elabore una tabla de frecuencias para la pregunta q5a

# 7) Elabore una tabla cruzada para la variable vb2 y la variable vb10

# 8) Elabore una tabla cruzada de la variable b47a y de la variable vb10

# 9) Con la tabla del paso anterior, haga una tabla cruzada con proporciones a nivel fila y columna. Exprese que significan.

# 10) Genere una variable de grupo de edad (grupo_edad) recodificando la variable de edad (q2) para agrupar a los respondientes en tres grupos:
# [18-29 años], [30-49 años], [50-70 años] y [Mayores de 71 años]

# 11) Genere una tabla cruzada, con proporciones por grupo de edad, para la variable vb2.



