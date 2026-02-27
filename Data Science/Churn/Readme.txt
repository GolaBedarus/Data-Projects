# 📊 Predicción de Abandono de Clientes (Customer Churn Prediction)

Proyecto desarrollado en el marco del **Diplomado de Ciencia de Datos y Análisis Avanzado – UTN**, correspondiente a la unidad **Modelado Predictivo I: Regresión y Clasificación**.

---

## 🎯 Objetivo del Proyecto

El objetivo principal de este trabajo es **predecir la probabilidad de abandono (churn)** de clientes de una empresa de telecomunicaciones utilizando técnicas de **Machine Learning supervisado**.

El modelo desarrollado permite identificar clientes con mayor riesgo de cancelar el servicio, lo que resulta clave para la toma de decisiones estratégicas orientadas a la **retención de clientes**.

La evaluación del desempeño de los modelos se realizó mediante la métrica **ROC AUC**, priorizando la capacidad discriminatoria del modelo.

---

## 📁 Estructura del Repositorio

```
📦 churn-prediction
 ┣ 📜 tp1.ipynb                 # Notebook principal del proyecto
 ┣ 📜 train.csv                 # Dataset de entrenamiento
 ┣ 📜 test.csv                  # Dataset sin variable objetivo
 ┣ 📜 predicciones_churn.csv    # ✅ Entregable final
 ┗ 📜 README.md
```

---

## 🧾 Dataset

Se utilizó el dataset **Telco Customer Churn**, que contiene información sobre:

* Datos demográficos de clientes
* Servicios contratados
* Información de facturación
* Antigüedad del cliente
* Cargos mensuales y totales
* Variable objetivo: **Churn** (abandono)

### Archivos

* **train.csv**

  * Incluye la variable objetivo `Churn`
  * Utilizado para entrenamiento y validación

* **test.csv**

  * No contiene la variable objetivo
  * Utilizado para generar predicciones finales

---

## 🔎 Análisis Exploratorio de Datos (EDA)

Durante el análisis exploratorio se identificaron los siguientes hallazgos:

* Existe **alta variabilidad** en antigüedad (`tenure`) y cargos económicos.
* Variables económicas y contractuales muestran fuerte relación con el abandono.
* La mayoría de los clientes no son adultos mayores.
* Se observaron diferencias claras entre clientes que abandonan y los que permanecen.

### Decisiones tomadas

✅ Conversión de tipos de datos
✅ Transformación de `TotalCharges` a variable numérica
✅ Conversión de variables binarias a categóricas
✅ No eliminación de outliers (representan clientes reales)
✅ Verificación de ausencia de valores nulos

---

## ⚙️ Preprocesamiento de Datos

Se implementó un **pipeline de procesamiento** para evitar fugas de información y garantizar comparabilidad entre modelos.

### Pasos aplicados

1. Separación de variables predictoras y objetivo
2. Identificación de variables numéricas y categóricas
3. Codificación mediante **One-Hot Encoding**
4. Escalado con **StandardScaler**
5. Integración completa mediante pipelines de `scikit-learn`

### Justificación

* **k-NN:** requiere escalado por trabajar con distancias.
* **Regresión Logística:** mejora estabilidad numérica.
* **Naive Bayes:** mantiene consistencia del flujo de datos.

---

## 🤖 Modelos Implementados

Se entrenaron y evaluaron tres algoritmos de clasificación:

| Modelo                 | Descripción                       |
| ---------------------- | --------------------------------- |
| Regresión Logística    | Modelo lineal interpretable       |
| k-Nearest Neighbors    | Clasificación basada en distancia |
| Naive Bayes (Gaussian) | Modelo probabilístico             |

### Métrica de Evaluación

✅ **ROC AUC**

Permite medir qué tan bien el modelo distingue entre clientes que abandonan y los que no.

---

## 🏆 Selección del Modelo Final

El modelo con mejor desempeño fue:

👉 **Regresión Logística**

### Motivos

* Buen ajuste al tipo de problema
* Relaciones aproximadamente lineales presentes en los datos
* Alta capacidad de generalización
* Interpretabilidad de resultados
* Estabilidad frente al ruido

Luego de su selección:

✅ Se reentrenó utilizando **todo el dataset de entrenamiento**
✅ Se generaron probabilidades de abandono sobre `test.csv`

---

## 📦 Entregable Final

El archivo final generado es:

```
predicciones_churn.csv
```

Contiene:

* Identificador del cliente
* Probabilidad estimada de abandono

Este archivo representa la salida final del modelo productivo.

---

## ▶️ Cómo Ejecutar el Proyecto

### 1️⃣ Clonar repositorio

```bash
git clone https://github.com/usuario/churn-prediction.git
cd churn-prediction
```

### 2️⃣ Instalar dependencias

```bash
pip install pandas numpy scikit-learn matplotlib seaborn
```

### 3️⃣ Ejecutar notebook

Abrir:

```
tp1.ipynb
```

y ejecutar todas las celdas en orden.

---

## 💡 Aplicaciones en el Mundo Real

Este tipo de modelos tiene múltiples aplicaciones empresariales:

### 📞 Telecomunicaciones

* Identificación temprana de clientes en riesgo
* Campañas de retención personalizadas

### 🏦 Banca y Fintech

* Predicción de cancelación de cuentas
* Prevención de fuga de usuarios

### 🛒 E-commerce

* Detección de clientes próximos a abandonar la plataforma
* Optimización de programas de fidelización

### 🎮 Servicios digitales / SaaS

* Reducción del churn en suscripciones
* Mejora del lifetime value (LTV)

---

## 🚀 Posibles Mejoras Futuras

* Optimización de hiperparámetros
* Implementación de modelos ensemble (Random Forest, Gradient Boosting)
* Feature engineering avanzado
* Interpretabilidad con SHAP o LIME
* Deployment como API predictiva

---

## 👤 Autor

**Galo Badaro**
Diplomado en Ciencia de Datos — UTN

---

## ✅ Conclusión

El proyecto demuestra cómo un flujo completo de **Data Science** —desde el análisis exploratorio hasta la generación de predicciones productivas— permite transformar datos históricos en información accionable para el negocio.

La predicción de churn constituye una herramienta estratégica clave para mejorar la retención de clientes y optimizar decisiones comerciales basadas en datos.

---
