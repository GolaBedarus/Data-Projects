# 1. Librerías

library(tidyverse)
library(lubridate)
library(fitdistrplus)
library(actuar)
library(MASS)


# 2. Dataset reducido

df <- read.csv("C:\\Users\\galob\\OneDrive\\Escritorio\\Data Analytics\\Proyectos\\Insurance Claims\\Dataset\\insurance_data.csv", stringsAsFactors = FALSE)

df <- df %>%
  dplyr::select(LOSS_DT, CLAIM_AMOUNT, PREMIUM_AMOUNT, POLICY_NUMBER, CUSTOMER_ID) %>%
  mutate(
    LOSS_DT = ymd(LOSS_DT),
    year = year(LOSS_DT),
    CLAIM_AMOUNT = as.numeric(CLAIM_AMOUNT)
  )

# 3. Filtrar severidad (sólo reclamos positivos)


severity <- df %>%
  filter(CLAIM_AMOUNT > 0) %>%
  pull(CLAIM_AMOUNT)

# 4. Ajuste de distribuciones

# Lognormal
fit_lnorm <- fitdist(severity, "lnorm")
# Pareto
fit_pareto <- fitdist(severity, "pareto", start = list(shape = 2, scale = 1000))

# La exponencial a veces no converge en este tipo de situaciones ya que 
# los datos tienen colas pesadas

# Comparación gráfica

par(mfrow = c(2, 2))
plot(fit_lnorm)
plot(fit_pareto)
par(mfrow = c(1, 1))


# Comparación numérica
gof <- gofstat(list(fit_lnorm, fit_pareto))
print(gof)

# 5. Frecuencia de reclamos

freq_por_anio <- df %>%
  group_by(year) %>%
  summarise(n_reclamos = sum(CLAIM_AMOUNT > 0, na.rm = TRUE))

lambda <- mean(freq_por_anio$n_reclamos)  # media para Poisson
cat("Frecuencia promedio anual:", lambda, "\n")

# 6. Simulación de pérdidas agregadas

set.seed(123)

n_sim <- 10000  # número de simulaciones
sim_losses <- numeric(n_sim)

for (i in 1:n_sim) {
  # Número de siniestros ~ Poisson
  n_claims <- rpois(1, lambda)
  # Severidad de cada siniestro ~ Lognormal (ajuste de antes)
  if (n_claims > 0) {
    sim_losses[i] <- sum(rlnorm(n_claims,
                                meanlog = fit_lnorm$estimate["meanlog"],
                                sdlog = fit_lnorm$estimate["sdlog"]))
  } else {
    sim_losses[i] <- 0
  }
}

# 7. Resultados de simulación

hist(sim_losses, breaks = 50,
     main = "Distribución simulada de pérdidas anuales",
     xlab = "Pérdidas agregadas")

quantiles <- quantile(sim_losses, probs = c(0.5, 0.9, 0.95, 0.99))
print(quantiles)