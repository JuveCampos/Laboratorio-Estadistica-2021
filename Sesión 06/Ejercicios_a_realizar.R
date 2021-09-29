# Sesión 06 -
library(tidyverse)

# # Inventamos datos:
# # Ingreso de los mexicanos
# 6+3+3+5+2+5
# extra <- rnorm(n = 1000, mean = 3000, sd = 1000)
# X = round(rnorm(n = 1000, mean = 12, sd = 3), 0)
#
# # 17*x = 40000
# # x = 40000/17
# min(X)
# max(X)
#
# ing = 3000 + 2000*X + extra
# plot(density(ing))
#
# cor(ing, X)
# cor(ing, extra)
# cor(X, extra)
#
# model <- lm(tibble(ing, X, extra),
#    formula = ing ~ X + extra)
#
# summary(model)

# Funciones generadoras de numeros aleatorios en R:
uniforme <- runif(n = 10, min = 1, max = 6)
alturas <- rnorm(n = 100, mean = 1.5, sd = 0.25)
min(alturas)
max(alturas)
plot(density(alturas))
sample(x = 1:6, size = 1000, replace = T)

# Datos de presión sanguínea
bd <- read.csv("https://raw.githubusercontent.com/JuveCampos/PeriodismoDeDatos2020/master/Laboratorio%2008/blodPressure.csv")

# Correlacion entre dos variables: ----
cor(bd$sistolicBloodPressure, bd$ageInYears)
cor(bd$sistolicBloodPressure, bd$weightInPounds)

# Matríz de correlación: ----

# Presión sanguínea:
cor(bd)
corrplot::corrplot(cor(bd), method = "color")
corrplot::corrplot(cor(bd), method = "circle")
corrplot::corrplot(cor(bd), method = "number")

# Carros
data("mtcars")
cor(mtcars)
?mtcars
corrplot::corrplot(cor(mtcars), method = "number")
corrplot::corrplot(cor(mtcars), method = "color")

mtcars %>%
  ggplot(aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm")


# Pinguinos
penguins <- palmerpenguins::penguins
lapply(penguins, class)
m_cor_pen <- cor(penguins[,c(3, 4, 5, 6)], use = "complete.obs")
corrplot::corrplot(m_cor_pen, method = "number")
corrplot::corrplot(m_cor_pen, method = "color")

# Modelo de regresion lineal:

# Para poder crear un modelo de regresión lineal es necesario que se cumpla con los siguientes supuestos:
#    Linealidad: Que la relación entre las variables sea lineal.
#  Independencia: Que los errores en la medición de las variables explicativas sean
# independientes entre sí.
#  Homocedasticidad: Que los errores tengan varianza constante.
#  Normalidad: Que las variables sigan la Ley Normal.
#  No colinealidad: Que las variables independientes no estén correlacionadas entre ellas.

modelo <- lm(data = bd, formula = sistolicBloodPressure ~ ageInYears)
modelo <- lm(data = bd, formula = sistolicBloodPressure ~ ageInYears + weightInPounds)
summary(modelo)

# Lineas ab
ggplot(data = bd, aes(x = ageInYears, y = sistolicBloodPressure)) +
  geom_point() +
  geom_abline(slope = 1.4632,
                  intercept = 58.7055,
              color = "red")

X = runif(n = 1000, min = 0, max = 100)
X3 = X^3
datos = tibble(X, X3)

modelo_1 <- lm(data = datos,
   formula = X ~ X3)

datos %>%
  ggplot(aes(x = X, y = X3)) +
  geom_point(alpha = 0.05) +
  geom_abline(intercept = 2.573e+01, slope = 9.486e-05, color = "red")




