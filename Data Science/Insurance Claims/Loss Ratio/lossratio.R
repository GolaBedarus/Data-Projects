file.choose()

# 1. Instalar y cargar librerías

install.packages(c("tidyverse", "lubridate", "fitdistrplus", "actuar"))

library(tidyverse)
library(lubridate)
library(fitdistrplus)
library(actuar)
library(dplyr)

# 2. Cargar dataset

df <- read.csv("C:\\Users\\galob\\OneDrive\\Escritorio\\Data Analytics\\Proyectos\\Insurance Claims\\insurance_data.csv", stringsAsFactors = FALSE)
View(df)

# 3. Seleccionar columnas relevantes

colnames(df)

df <- df %>%
  dplyr::select(LOSS_DT, CLAIM_AMOUNT, PREMIUM_AMOUNT, POLICY_NUMBER, CUSTOMER_ID)

# 4. Limpieza de datos

# Convertir fechas
df <- df %>%
  mutate(LOSS_DT = ymd(LOSS_DT),
         year = year(LOSS_DT))

# Asegurar que CLAIM_AMOUNT y PREMIUM_AMOUNT sean numéricos
df$CLAIM_AMOUNT <- as.numeric(df$CLAIM_AMOUNT)
df$PREMIUM_AMOUNT <- as.numeric(df$PREMIUM_AMOUNT)


# 5. Frecuencia de siniestros


# Por cliente
freq_cliente <- df %>%
  group_by(CUSTOMER_ID) %>%
  summarise(n_siniestros = sum(CLAIM_AMOUNT > 0, na.rm = TRUE))

cat("Frecuencia promedio por cliente:", mean(freq_cliente$n_siniestros), "\n")

# 6. Severidad de siniestros

severity <- df %>%
  filter(CLAIM_AMOUNT > 0) %>%
  pull(CLAIM_AMOUNT)

cat("Promedio de severidad:", mean(severity), "\n")
cat("Mediana de severidad:", median(severity), "\n")

# Histograma de severidad
hist(severity, breaks = 50,
     main = "Distribución de severidad de siniestros",
     xlab = "Monto del reclamo", col = "skyblue")

# 7. Siniestros agregados por año

agg <- df %>%
  group_by(year) %>%
  summarise(
    n_siniestros = sum(CLAIM_AMOUNT > 0, na.rm = TRUE),
    total_pagos = sum(CLAIM_AMOUNT, na.rm = TRUE),
    promedio_pago = mean(CLAIM_AMOUNT[CLAIM_AMOUNT > 0], na.rm = TRUE)
  )

print(agg)

ggplot(agg, aes(x = factor(year), y = total_pagos)) +
  geom_col(fill = "steelblue") +
  labs(title = "Siniestros agregados por año",
       x = "Año",
       y = "Monto total")

# 8. Ratio de siniestralidad (Loss Ratio)

# Total reclamos / Total primas
total_claims <- sum(df$CLAIM_AMOUNT, na.rm = TRUE)
total_premiums <- sum(df$PREMIUM_AMOUNT, na.rm = TRUE)
loss_ratio <- total_claims / total_premiums

cat("Loss Ratio general:", round(loss_ratio * 100, 2), "%\n")

