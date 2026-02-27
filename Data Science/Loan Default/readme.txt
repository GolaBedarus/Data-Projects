# 💳 Loan Default Prediction – Credit Scoring Model

Proyecto desarrollado como **Trabajo Final Integrador** del *Diplomado en Ciencia de Datos y Análisis Avanzado*, orientado al desarrollo de un **sistema de scoring crediticio** capaz de estimar el riesgo de incumplimiento de préstamos.

El objetivo del proyecto es construir un modelo predictivo que permita **mejorar la toma de decisiones financieras**, reduciendo pérdidas asociadas al otorgamiento de créditos a clientes con alta probabilidad de default.

---

## 🎯 Objetivo del Proyecto

El propósito principal es predecir la probabilidad de **default (incumplimiento de pago)** de solicitantes de préstamos antes de aprobar un crédito.

El modelo desarrollado permite:

* Estimar riesgo crediticio individual
* Recomendar aprobación o rechazo automático
* Optimizar decisiones basadas en impacto económico
* Reducir pérdidas financieras

El sistema sigue una metodología estructurada alineada con **CRISP-DM**, tal como requiere el Proyecto Final Integrador .

---

## 📁 Estructura del Repositorio

```id="repo01"
📦 loan-default-scoring
 ┣ 📜 Anonymize_Loan_Default_data.csv   # Dataset original anonimizado
 ┣ 📜 Informe_Proyecto_Loan_Default.docx
 ┣ 📜 Trabajo Final Integrador VF (Pre-entrega).pdf
 ┣ 📜 loan_scoring_output.csv           # ✅ Entregable final
 ┗ 📜 README.md
```

---

## 🧾 Dataset

Se utilizó el dataset **Loan Default (Kaggle)** que contiene información financiera anonimizada de solicitantes de crédito.

### Características generales

* Información crediticia y financiera
* Historial de pagos
* Nivel de endeudamiento
* Tasas de interés
* Variables de comportamiento financiero

### Variable objetivo

* **Default / Repay Fail**

  * `1` → Cliente incumple
  * `0` → Cliente cumple pagos

El dataset permite abordar un problema de **clasificación binaria altamente relevante en fintech y banca**.

---

## 🔎 Análisis Exploratorio de Datos (EDA)

El análisis exploratorio permitió identificar:

* Desbalance moderado entre clientes en default y no default
* Variables financieras altamente correlacionadas con el incumplimiento
* Influencia significativa de:

  * tasa de interés
  * historial de pagos
  * monto del préstamo
  * ratio deuda/ingreso

Se analizaron distribuciones, correlaciones y comportamiento del target para comprender el riesgo crediticio.

---

## ⚙️ Metodología – CRISP-DM

El proyecto fue desarrollado siguiendo las etapas:

1. **Comprensión del negocio**
2. **Comprensión de datos**
3. **Preparación de datos**
4. **Modelado**
5. **Evaluación**
6. **Simulación de despliegue**

Este enfoque permite conectar métricas técnicas con impacto económico real .

---

## 🧹 Preparación de Datos

Se aplicaron los siguientes procesos:

✅ Limpieza de datos
✅ Imputación de valores faltantes
✅ Codificación de variables categóricas
✅ Ingeniería de variables financieras
✅ Separación train/test
✅ Pipeline reproducible

El objetivo fue evitar fugas de información y garantizar estabilidad del modelo.

---

## 🤖 Modelos Implementados

Se evaluaron múltiples algoritmos de clasificación:

| Modelo              | Rol                               |
| ------------------- | --------------------------------- |
| Dummy Classifier    | Baseline                          |
| Logistic Regression | Modelo interpretable              |
| Random Forest       | Captura relaciones no lineales    |
| XGBoost             | Modelo boosting de alto desempeño |

---

## 📏 Métricas de Evaluación

Dado que el problema presenta **impacto económico asimétrico**, se utilizaron:

* ✅ ROC-AUC
* ✅ PR-AUC
* ✅ Recall
* ✅ F1-Score

Se priorizó especialmente el **Recall**, ya que aprobar clientes que luego incumplen representa la mayor pérdida financiera.

---

## 🎯 Optimización del Umbral de Decisión

A diferencia de un enfoque puramente académico, el proyecto optimiza el **threshold de clasificación** considerando costos de negocio:

* Alto costo → aprobar cliente en default
* Bajo costo → rechazar cliente solvente

Esto permite traducir predicciones en **decisiones reales de crédito**.

---

## 💰 Impacto en el Negocio

Se realizó una simulación económica comparando:

### Escenario sin modelo

Aprobación indiscriminada de préstamos.

### Escenario con modelo predictivo

Aprobación basada en scoring.

Resultados simulados:

* Ganancia SIN modelo: **−$6,159,005**
* Ganancia CON modelo: **$7,195,420**

✅ **Mejora económica estimada:**
💰 **+$13,354,425**

El modelo demuestra valor directo para entidades financieras.

---

## 📦 Entregable Final

El archivo final generado es:

```id="repo02"
loan_scoring_output.csv
```

Contiene:

* Identificador del solicitante
* Probabilidad estimada de default
* Score crediticio utilizado para decisión

Este archivo representa la salida productiva del sistema de scoring.

---

## ▶️ Cómo Ejecutar el Proyecto

### 1️⃣ Clonar repositorio

```bash id="repo03"
git clone https://github.com/usuario/loan-default-scoring.git
cd loan-default-scoring
```

### 2️⃣ Instalar dependencias

```bash id="repo04"
pip install pandas numpy scikit-learn xgboost matplotlib seaborn
```

### 3️⃣ Ejecutar análisis / modelo

Abrir el notebook o scripts asociados al proyecto y ejecutar el pipeline completo.

---

## 💡 Aplicaciones Reales

### 🏦 Bancos y Fintech

* Evaluación automática de préstamos
* Reducción de mora crediticia

### 💳 Tarjetas de Crédito

* Ajuste dinámico de límites
* Prevención de incumplimiento

### 🪙 Microcréditos

* Inclusión financiera con control de riesgo

### 📊 Risk Management

* Portfolio crediticio optimizado
* Pricing basado en riesgo

---

## 🚀 Mejoras Futuras

* Monitoreo de **data drift**
* Reentrenamiento periódico
* Explainability (SHAP / LIME)
* Fairness y sesgos algorítmicos
* Deployment como API de scoring
* Integración con sistemas core bancarios

---

## 👤 Autor

**Galo Badaro**
Diplomado en Ciencia de Datos y Análisis Avanzado

---

## ✅ Conclusión

El proyecto demuestra cómo un sistema de **Machine Learning aplicado al riesgo crediticio** puede transformar datos financieros en decisiones estratégicas medibles económicamente.

El modelo desarrollado no solo mejora métricas predictivas, sino que genera **impacto financiero tangible**, alineando ciencia de datos con objetivos reales de negocio.

---
