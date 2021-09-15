# Código de la sesión 04 - manejo de sjmisc::rec()

# 1) Cargar librerias
pacman::p_load(sjmisc, sjlabelled, tidyverse, haven)

# 2) Cargar la base:
base15 <- read_sav("http://www.losmexicanos.unam.mx/culturapolitica/encuesta_nacional/base_datos/Encuesta_Nacional_de_Cultura_Politica.sav")
# Modificar la base:
cp15 <- base15 %>%
  dplyr::select(
    #identificación partidista
    p78,
    #satisfacción con la democracia
    p35,
    #educación
    sd4,
    #sexo
    sd1,
    #edad
    sd2,
    #importancia de la democracia
    p33,
    #evaluación de la democracia
    p34,
    #ponderador y estado
    Pondi2, edo
  )

# Recodificamos variables
cp15 <- cp15 %>%
  mutate(
    identif= rec(p78, rec= "1=1 [PRI]; 2=2 [PAN]; 3=3 [PRD]; 8=4 [MORENA]; 12= 6 [ninguno]; 98:99= NA [NA] ; else= 5 [otro]", as.num= F),
    satDemo1= rec(p35, rec= "8:9= NA; else=copy", val.labels= get_labels(p35)),
    satDemo= rec(satDemo1, rec= "rev"),
    edu= rec(sd4, rec= "1=1 [Ning]; 2:3=2 [Prim]; 4=3 [Sec]; 5:7=4 [Prep]; 8=5 [Lic]; 9:10=6 [Posg]; 98:99= NA"),
    sexo= sd1,
    edad= sd2,
    impoDem= rec(p33, rec= "98:99= NA; else= copy"),
    demMex= rec(p34, rec= "98:99= NA; else= copy")
  )

# 3) Ejemplo del grupo de edad:

base15$sd2
get_label(base15$sd2)
get_labels(base15$sd2)
summary(base15$sd2)

base15 <- base15 %>%
  mutate(grupo_edad = rec(sd2,
                          rec = "17:29 = 1 [Jóvenes]; 30:39 = 2 [Adultos jóvenes];
                          40:49 = 3 [Adultos]; 49:80 = 4 [Mayores]",
                          as.num = T,
                          var.label = "Grupo de edad de las personas"))

base15$grupo_edad
frq(base15$grupo_edad)
table(base15$grupo_edad)

# 4) Ejercicio 06 de la tarea.

base15$p52
get_labels(base15$opin)
base15 <- base15 %>%
  mutate(opin = rec(p52,
                    rec = "8,9 = NA; else = copy",
                    val.labels = get_labels(p52)
  )) %>%
  mutate(opin = rec(opin,
                    # rec = "1 = 4 [Mucho]; 2 = 3 [Algo]; 3 = 2 [Poco]; 4 = 1 [Nada]"
                    rec = "rev"
                    ))
base15$opin
frq(base15$opin)
