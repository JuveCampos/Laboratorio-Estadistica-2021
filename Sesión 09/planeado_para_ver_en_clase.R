# Librerias:
library(tidyverse)

# Base de datos:
tombola <- read_csv("tombola.csv") %>%
  select(-1)

#                          P(A)        P(A)
# Probabilidad cardinal: --------- = --------
#                          P(O)         1

unique(tombola$bolitas)

tombola %>%
  group_by(bolitas) %>%
  count() %>%
  ungroup() %>%
  mutate(prop = n/sum(n))

muestra = tibble(bolitas = sample(tombola$bolitas, size = 1000))

muestra %>%
  group_by(bolitas) %>%
  count() %>%
  ungroup() %>%
  mutate(prop = n/sum(n))


# Variando el tamaño de muestra:

resultados = tibble()
tamanio = 10

for(tamanio in 1:1000){
  muestra = tibble(bolitas = sample(tombola$bolitas, size = tamanio))
  prop = muestra %>%
    group_by(bolitas) %>%
    count() %>%
    ungroup() %>%
    mutate(prop = n/sum(n)) %>%
    mutate(tamanio = tamanio)

  resultados = rbind(resultados, prop)

  print(tamanio)
}

resultados %>%
  filter(bolitas == "azul") %>%
  ggplot(aes(x = tamanio, y = prop)) +
  geom_point()

# 2. Con el mismo tamaño de la muestra, hacer el muestreo n veces.

# 10 bolitas:
tamanio_muestra = 5
rez = tibble()
for(i in 1:1000){
  rez_0 = tibble(x = sample(tombola$bolitas, tamanio_muestra)) %>%
    group_by(x) %>%
    count() %>%
    ungroup() %>%
    mutate(pp = n/sum(n)) %>%
    mutate(i = i)
  rez = rbind(rez, rez_0)
  print(i)
}


datos_azul = rez %>%
  filter(x == "azul")

media_azul = mean(datos_azul$pp)
sd_azul = sd(datos_azul$pp)
rango = quantile(datos_azul$pp, c(0.025, 0.975))

plt_azul = datos_azul %>%
  ggplot(aes(x = pp)) +
  geom_density() +
  scale_x_continuous(limits = c(0, 1)) +
  geom_vline(xintercept = media_azul, color = "blue")  +
  geom_vline(xintercept = rango, linetype = 2, color = "olivedrab")

plt_azul

# Con las bolas rojas:
datos_rojo = rez %>%
  filter(x == "roja")

media_rojo = mean(datos_rojo$pp)
sd_rojo = sd(datos_rojo$pp)
rango = quantile(datos_rojo$pp, c(0.025, 0.975))

plt_rojo = datos_rojo %>%
  ggplot(aes(x = pp)) +
  geom_density() +
  scale_x_continuous(limits = c(0, 1)) +
  geom_vline(xintercept = mean(datos_rojo$pp), color = "red") +
  geom_vline(xintercept = rango, linetype = 2, color = "olivedrab")

plt_rojo






