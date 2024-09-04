
# Diseño cuadrado latino 
#datos=read.delim("clipboard",dec=",")
#

# Instalar y cargar paquetes necesarios
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Datos
data <- data.frame(
  Periodo = rep(1:5, each = 5),
  Vaca = factor(rep(1:5, times = 5)),
  Tratamiento = factor(c('A', 'B', 'C', 'D', 'E', 'C', 'D', 'A', 'E', 'B', 
                         'D', 'E', 'A', 'B', 'C', 'E', 'A', 'B', 'C', 'D', 
                         'B', 'C', 'D', 'E', 'A')),
  Produccion = c(33, 34, 26, 34, 33, 30, 28, 24, 28, 28, 
                 28, 28, 20, 31, 22, 31, 22, 18, 31, 31, 
                 28, 22, 15, 30, 19)
)
View(data)
# Mostrar los primeros registros del data frame
head(data)

# Análisis de Varianza (ANOVA) para el diseño cuadrado latino
modelo <- aov(Produccion ~ Periodo + Vaca + Tratamiento, data = data)
summary(modelo)

# Gráfica de barras de la producción por tratamiento
ggplot(data, aes(x = Tratamiento, y = Produccion, fill = Tratamiento)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Producción promedio de leche por Tratamiento",
       x = "Tratamiento",
       y = "Producción")

# Gráfica de caja (boxplot) de la producción por vaca
ggplot(data, aes(x = Vaca, y = Produccion, fill = Vaca)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Distribución de la producción de leche por Vaca",
       x = "Vaca",
       y = "Producción")

# Gráfica de interacción entre Periodo y Tratamiento
interaction.plot(data$Periodo, data$Tratamiento, data$Produccion, 
                 col = rainbow(5), lty = 1, type = "b",
                 main = "Interacción entre Periodo y Tratamiento",
                 xlab = "Periodo",
                 ylab = "Producción")


