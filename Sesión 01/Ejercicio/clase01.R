library(tidyverse)
library(haven)
library(sjmisc)
library(sjlabelled)

set.seed(1)
x <- c(runif(n = 10))
x
x[9]

x <- tibble::tibble(x = c(runif(n = 10)),
                    y = c(rep("a", 10))
                    )

x[6,"x"]
x[,"x"]
x[6,]
x[1,2]

# Lo mismo:
x %>%
  select(x)
x[,"x"]

x %>%
  slice(6)
x[6,]

# Filtrar
x[x$x < 0.5,]
x %>%
  filter(x < 0.5)

x[x$x > 0.7,]
x %>%
  filter(x > 0.7)

# Sacar un vector de una tabla
x$y
x %>%
  pull(y)

# Aplicar funciones
mean(x$x)
sd(x$x)
median(x$x)

x %>%
  summarise(mediana = median(x)) %>%
  pull()


url <- "https://github.com/JuveCampos/PeriodismoDeDatos2020/raw/master/Laboratorio%2001/survey.sav"
survey <- read_sav(url)
class(survey)

survey[survey$sex == 2,]
survey %>%
  filter(sex == 2)

# rbase:
survey[survey$sex == 2 & survey$marital == 4 & survey$child != 0, c("id", "sex", "smokenum")]
sjlabelled::get_labels(survey$sex)
get_label(survey)

