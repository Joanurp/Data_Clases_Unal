##################################
# Diseño completamente al azar
#################################
# Modulo 4
# O. Elias Bru-Cordero
# Universidad Nacional de Colombia 
# sede de La Paz, Cesar.


# Cargar librarias 

library(agricolae)
library(emmeans)
library(ggplot2)
#library(xtable)


# Ejemplo 1

## Variedad de lentejas
y<-c(740,430,760,640,545,440,390,325,290,740,630,870,605,505,430,540)
ttos<-factor(rep(1:5,c(4,3,2,3,4)),labels = c("V1","V2","V3","V4","V5"))
Datos<-data.frame(ttos,y)
Datos


## Boxplot
ggplot(Datos, aes(x=ttos,y=y)) + geom_boxplot(aes(fill=ttos),show.legend=F)+ 
  stat_boxplot(geom ='errorbar')+xlab("Variedades  de Lentejas") + 
  ylab("Producción")+stat_summary(fun.y=mean, geom="point", shape=18,size=3, color="red")

#ANAVA Paso a paso
n<-length(y);n
y..<-sum(y);y..
yb..<-mean(y);yb..

#Factor de corrección
FC<-n*(yb..^2) ;FC

# Repeticiones
rj<-tapply(y,ttos,length);rj

#totales por tratamientos
y.j<-tapply(y,ttos,sum);y.j

#medias por tratamientos
yb.j<-tapply(y,ttos,mean);yb.j
round(yb.j,1)


# número de tratamientos
(t<-length(y.j))

SCT<-sum(y^2)-FC ;SCT

SCtto<-sum((y.j^2)/rj)-FC ;SCtto

SCE<-SCT-SCtto ;SCE

CMtto<-SCtto/(t-1);CMtto

CME<-SCE/(n-t);CME

Fc<-CMtto/CME;Fc


# Crear una tabla ANOVA
anova_table <- data.frame(
  Fuente_de_Variación = c("Tratamientos", "Error", "Total"),
  Suma_de_Cuadrados = c(SCtto, SCE, SCT),
  Grados_de_Libertad = c(t-1, n-t, n-1),
  Cuadrados_Medios = c(CMtto, CME, NA),
  F = c(Fc, NA, NA)
)

# Mostrar la tabla ANOVA
print(anova_table)


Ft<-qf(1-0.05,t-1,n-t); Ft
round(Ft,2)

Fc>Ft
# se rechaza la hipotesis nula, es decir
# existe suficiente evidencia muestral para 
# poder inferir que existe diferencia 
# entre las medias de los ttos.

############################################################################
#   ANAVA de forma directa
mod<-aov(y~ttos,data=Datos)
anova(mod)



# supuestos 

Residuales = rstandard(mod)
par(mfrow=c(2,2))
hist(Residuales)
plot(density(Residuales))
qqnorm(Residuales, ylab = "residuales")
qqline(Residuales)
shapiro.test(Residuales) # Shapiro-Wilk


# Otras pruebas 

library(nortest)
ad.test(Residuales) # Anderson-Darling
cvm.test(Residuales) # Cramer-Von
pearson.test(Residuales) # Lilliefors (Kolmogorov-Smirnov)
sf.test(Residuales) # Shapiro-Francia

## Prueba de Homogeneidad de varianzas.

# H_{0}:=Varianzas homogéneas
# H_{alt}:=Varianzas No homogéneas

# Se graficaran la variable respuesta vs. los residuales y los Valores ajustados vs. 
# los residuales, para verificara que no se presentan ningún patrón especifico 
# en la nueve de puntos. Esto nos indicará nos dará sospechas de si hay independencia
# en los errores y homogeneidad de varianzas respectivamente. Por último realizaremos 
# las prueba teórica.

par(mfrow=c(1,2))
plot(y,Residuales)
abline(h=0)
valores.ajustados = fitted(mod)
plot(valores.ajustados, Residuales)
abline(h=0)
bartlett.test(y,ttos)

# Levene
library(car)
library(carData)
leveneTest(y,ttos)


# otra prueba 
library(lawstat)
levene.test(y, ttos, location = "median", correction.method = "none")


## comparación múltiple:
# El método de la diferencia mínima significativa (DMS)
LSD<-LSD.test(mod,"ttos",group=T,p.adj="none",console=TRUE)
LSD

plot(LSD,variation="SD")

######_________Tukey_____________#######
TUKEY<- HSD.test(mod,"ttos",group=TRUE,console=TRUE)
TUKEY

plot(TUKEY,variation="SD")

######_________Duncan_____________#######
DUNCAN<- duncan.test(mod, "ttos",group=T,console=TRUE)
DUNCAN

plot(DUNCAN,variation="SD")

# Validación de los puestos:

# Shapiro-Wilk normality test
shapiro.test(mod$residuals) 

# H0: los residuales son normal
# H1: no lo son 

# como el p-valor > 0.05 no se rechaza Ho, 
# es decir los residuales del modelo ajustado
# siguen una distribucion normal. 

# Bartlett test of homogeneity of variances
bartlett.test(y~ttos,data=Datos)


###################### Ejemplo 2
## Diabetes con tratamiento control
y<-c(120,150,135,121,122,142,126,125,151,130,124,130,150,145,95,99,110,111,98,105,103,110,120,120,115,114,106,116)
ttos<-factor(rep(1:4,each=7),labels = c("Control","T1","T2","T3"))
Datos<-data.frame(ttos,y)
View(Datos)
### Prueba de Dunnett
mod<-aov(y~ttos,data=Datos)
anova(mod)
aov1.emm = emmeans(mod, specs =~ttos)
contrast(aov1.emm, "dunnett")

#### Ejemplo 3

# inundaciones 

y_INU<-c(0.34,0.12,1.23, 0.70, 1.75, 0.12, 
         0.91, 2.94, 2.14,2.36,2.86, 4.55,
         6.31, 8.37, 9.75, 6.09, 9.82, 7.24, 
         17.15, 11.82, 10.95, 17.20, 14.35, 16.82)
ttos_INU<-factor(rep(1:4,c(6,6,6,6)),labels = c("M1","M2","M3","M4"))
Datos_INU<-data.frame(ttos_INU,y_INU)
Datos_INU

#   ANAVA de forma directa
mod_INU<-aov(y_INU~ttos_INU,data=Datos_INU)
anova(mod_INU)


