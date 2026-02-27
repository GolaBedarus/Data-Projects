# 📈 Forecasting de Consumo Eléctrico – PJM Hourly Energy Load

Proyecto desarrollado en el marco de **Machine Learning 2 – Módulo 6**, cuyo objetivo es aplicar distintos algoritmos de aprendizaje automático (incluyendo modelos clásicos y de series de tiempo) y analizar su desempeño comparativo, conforme a la consigna del trabajo práctico .

---

## 🎯 Objetivo del Proyecto

El objetivo principal es **predecir el consumo horario de energía eléctrica** utilizando modelos de Machine Learning y modelos específicos de series de tiempo.

Se comparan distintos enfoques predictivos para evaluar:

* Capacidad de generalización
* Performance en datos temporales
* Tiempo de entrenamiento
* Robustez frente a patrones estacionales

El entregable final consiste en el desarrollo del modelo óptimo y el análisis comparativo de resultados.

---

## 📁 Estructura del Repositorio

```
📦 energy-forecasting
 ┣ 📜 timeseries.ipynb         # Notebook principal del proyecto
 ┣ 📜 PJME_hourly.csv          # Dataset de consumo eléctrico horario
 ┣ 📜 TP Machine Learning 2.pdf # Consigna del trabajo práctico
 ┗ 📜 README.md
```

---

## 🧾 Dataset

### 📊 PJME Hourly Energy Consumption

El dataset contiene el **consumo eléctrico horario** correspondiente a la región PJM East (Estados Unidos).

* Variable principal: `PJME_MW`
* Índice temporal: timestamp horario
* Frecuencia: Horaria
* Problema: **Regresión – Serie de Tiempo**

### Contexto del problema

El forecasting energético es clave para:

* Planificación de generación eléctrica
* Gestión de demanda
* Optimización de redes de distribución
* Reducción de costos operativos

---

## 🔎 Análisis Exploratorio (EDA)

Durante el análisis se observaron:

* Fuerte **estacionalidad diaria y anual**
* Tendencias de largo plazo
* Patrones repetitivos por hora del día
* Picos de consumo en estaciones extremas

Se realizaron visualizaciones temporales para identificar:

* Tendencia
* Estacionalidad
* Comportamiento cíclico

---

## ⚙️ Feature Engineering

Para adaptar los modelos de Machine Learning tradicionales al contexto temporal, se realizaron:

* Extracción de:

  * Hora
  * Día
  * Mes
  * Año
  * Día de la semana
* Creación de variables rezagadas (lags)
* Posible diferenciación para estacionariedad (en ARIMA)

Estas transformaciones permiten que modelos no secuenciales capten estructura temporal.

---

## 📏 Métrica de Evaluación

Se seleccionó como métrica principal:

### ✅ RMSE (Root Mean Squared Error)

Justificación:

* Penaliza más fuertemente errores grandes.
* Es interpretable en las mismas unidades del consumo (MW).
* Es estándar en problemas de forecasting.

Adicionalmente se puede considerar:

* MAE
* Tiempo de entrenamiento (criterio complementario)

---

## 🤖 Modelos Implementados

Siguiendo la consigna del trabajo práctico  se probaron distintos modelos:

### 1️⃣ Regresión Lineal (ML1 – Obligatorio)

Modelo base para capturar tendencia lineal.

### 2️⃣ Random Forest Regressor

Modelo basado en árboles capaz de capturar relaciones no lineales.

### 3️⃣ ARIMA

Modelo clásico de series de tiempo que modela:

* Autoregresión
* Diferenciación
* Media móvil

---

## 📊 Comparación de Modelos

Se analizaron:

* RMSE en conjunto de test
* Capacidad de capturar estacionalidad
* Tiempo de entrenamiento
* Complejidad computacional

### Observaciones generales

* Regresión Lineal: rápida pero limitada ante no linealidades.
* Random Forest: buena performance, captura patrones complejos.
* ARIMA: fuerte modelado temporal estructurado, pero sensible a parametrización.

El modelo seleccionado fue el que mostró mejor balance entre:

✔ Error bajo
✔ Capacidad predictiva
✔ Estabilidad

---

## ▶️ Cómo Ejecutar el Proyecto

### 1️⃣ Clonar repositorio

```bash
git clone https://github.com/usuario/energy-forecasting.git
cd energy-forecasting
```

### 2️⃣ Instalar dependencias

```bash
pip install pandas numpy scikit-learn matplotlib seaborn statsmodels
```

### 3️⃣ Ejecutar Notebook

Abrir:

```
timeseries.ipynb
```

y ejecutar todas las celdas en orden.

---

## 💡 Aplicaciones Reales

Este tipo de modelos tiene aplicaciones directas en:

### ⚡ Empresas Energéticas

* Predicción de demanda
* Ajuste de generación en tiempo real

### 🏭 Industria

* Planificación de consumo energético
* Reducción de costos

### 🌍 Gobierno y Planificación Urbana

* Diseño de infraestructura eléctrica
* Políticas de eficiencia energética

### 🔋 Energías Renovables

* Integración de fuentes variables (solar/eólica)
* Balance entre oferta y demanda

---

## 🚀 Posibles Mejoras Futuras

* Implementar SARIMA para estacionalidad explícita
* Modelos de boosting (XGBoost, LightGBM)
* Redes neuronales LSTM
* Validación cruzada temporal (TimeSeriesSplit)
* Optimización automática de hiperparámetros

---

## 👤 Autor

Galo Badaro
Diplomado en Ciencia de Datos – UTN

---

## ✅ Conclusión

El proyecto demuestra la importancia de:

* Entender la estructura temporal de los datos
* Comparar modelos clásicos de ML con modelos específicos de series de tiempo
* Justificar métricas y conclusiones

El forecasting energético representa un problema estratégico de alto impacto económico y operativo, donde el uso adecuado de modelos predictivos permite optimizar recursos y anticipar escenarios futuros.

---
