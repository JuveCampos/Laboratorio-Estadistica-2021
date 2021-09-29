# Documentos ----

# Boletín de prensa:
# https://www.inegi.org.mx/contenidos/saladeprensa/boletines/2021/EstSegPub/Envipe2021.pdf

# Diseño Muestral:
# https://www.inegi.org.mx/contenidos/productos/prod_serv/contenidos/espanol/bvinegi/productos/nueva_estruc/889463902454.pdf

# Presentación de resultados:
# https://www.inegi.org.mx/contenidos/programas/envipe/2021/doc/envipe2021_presentacion_nacional.pdf

# Descriptor de archivos:
# https://www.inegi.org.mx/contenidos/programas/envipe/2021/doc/fd_envipe2021.pdf

# Librerias ----
library(tidyverse) # Manejo de datos
library(survey)    # Manejo de encuestas
library(haven)     # Abrir archivos de Stata o SPSS
# Si hubiera etiquetas:
library(sjmisc)
library(sjlabelled)

# Datos ----
# bd <- read_dta("bd_envipe_2021_dta/TPer_Vic1.dta")
bd <- read_sav("bd_envipe_2021_sav/TPer_Vic2.sav") %>%
  filter(RESUL_H == "A") # Encuestas tipo "A" (Con victimización)
# vic <- read_sav("bd_envipe_2021_sav/TMod_Vic.sav")

# Declaramos el diseño muestral:
design = svydesign(data=bd,
                   id=~ID_PER,
                   strata=~ESTRATO,
                   weights=~FAC_ELE)

# Obtenemos totales
svytotal(x = ~SEXO, design = design)

# Comprobamos a mano
bd %>%
  group_by(NOM_ENT) %>%
  summarise(casos = sum(FAC_ELE))

# ?svytotal
# Sumamos los factores de expansión
sum(bd$FAC_ELE)

