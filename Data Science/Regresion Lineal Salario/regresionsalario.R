# analisis_salary.R
library(tidyverse)
library(broom)

datos <- read_csv("C:\\Users\\galob\\OneDrive\\Escritorio\\Data Analytics\\Proyectos\\Regresion Lineal Salario\\Salary_dataset.csv")
datos <- dplyr::select(datos, -1)



# Limpieza básica
datos <- datos %>%
  mutate(
    YearsExperience = as.numeric(YearsExperience),
    Salary = as.numeric(Salary)
  )

# Exploración
glimpse(datos)
summary(datos)

# Gráfico
ggplot(datos, aes(YearsExperience, Salary)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Salary vs Years of Experience", x = "YearsExperience", y = "Salary")

# Modelo
modelo <- lm(Salary ~ YearsExperience, data = datos)
print(summary(modelo))
print(tidy(modelo))
print(glance(modelo))

# Diagnóstico
par(mfrow = c(2,2))
plot(modelo)
par(mfrow = c(1,1))

# Predicciones de ejemplo
nuevos <- tibble(YearsExperience = c(2, 5, 8))
predicciones <- predict(modelo, nuevos, interval = "prediction")
print(bind_cols(nuevos, as_tibble(predicciones)))

# Métrica RMSE
pred_train <- predict(modelo, datos)
rmse <- sqrt(mean((datos$Salary - pred_train)^2))
print(paste("RMSE:", round(rmse,2)))

# Guardar
saveRDS(modelo, "modelo_lm_salary.rds")
write_csv(augment(modelo), "diagnostico_modelo.csv")
ggsave("salary_vs_exp.png")
