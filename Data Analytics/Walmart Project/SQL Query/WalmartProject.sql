DESCRIBE walmartdataset;

UPDATE walmartdataset
SET Date = DATE_FORMAT(STR_TO_DATE(Date, '%d/%m/%Y'), '%Y-%m-%d');

ALTER TABLE walmartdataset
MODIFY COLUMN Date DATE;

# Esto lo hice para cambiar el formato de fecha a uno que SQL pueda interpretar

SELECT *
FROM walmart.walmartdataset;

# esta es la base de datos que voy a utilizar para el proyecto
# primero voy a calcular el total de ventas por tienda 

SELECT Store, SUM(Weekly_Sales) AS Total_Sales
FROM walmartdataset
GROUP BY Store
ORDER BY Total_Sales DESC;

# Luego voy a calcular el Promedio de Ventas por semana

SELECT AVG(Weekly_Sales) AS Promedio_Semanal
FROM walmartdataset;

# ¿Cuál es la semana con mayores ventas?

SELECT Store, Date, Weekly_Sales
FROM walmartdataset
ORDER BY Weekly_Sales DESC
LIMIT 1;

# ¿Cómo afectan los feriados a las ventas? 

SELECT Holiday_Flag, AVG(Weekly_Sales) AS Promedio_Ventas
FROM walmartdataset
GROUP BY Holiday_Flag;

# Análisis Temporal

# Ventas por mes 

SELECT MONTH(Date) AS Mes, SUM(Weekly_Sales) AS Ventas
FROM walmartdataset
GROUP BY Mes
ORDER BY Mes;

# Tendencia de ventas a lo largo del tiempo 

SELECT Date, SUM(Weekly_Sales) AS Ventas_Totales
FROM walmartdataset
GROUP BY Date
ORDER BY Date;

## Estos datos pueden ser trabajados en Excel, Power BI o Tableau

# ¿Cuál es la relación entre el precio del combustible y las ventas?

SELECT Fuel_Price, AVG(Weekly_Sales) AS Promedio_Ventas
FROM walmartdataset
GROUP BY Fuel_Price
ORDER BY Fuel_Price;

# Como no observo una tendencia clara, entonces tendré que ver en qué fechas 
# Ocurrieron dichos sucesos y asi evaluar otros factores como por ejemplo inflacion

SELECT 
  Fuel_Price,
  Date,
  AVG(Weekly_Sales) AS Promedio_Ventas
FROM walmartdataset
GROUP BY Fuel_Price, Date
ORDER BY Promedio_Ventas DESC
LIMIT 5;


# ¿Afecta el desempleo a las ventas?

SELECT ROUND(Unemployment, 1) AS Tasa_Desempleo, AVG(Weekly_Sales) AS Promedio_Ventas
FROM walmartdataset
GROUP BY Tasa_Desempleo
ORDER BY Tasa_Desempleo;

## Respuesta: Sí, claramente el desempleo afecta a las ventas 


## ¿Cuáles son las 5 tiendas con mayores ventas promedio?

SELECT Store, AVG(Weekly_Sales) AS Promedio
FROM walmartdataset
GROUP BY Store
ORDER BY Promedio DESC
LIMIT 5;

## Esta informacion puede resultar util para una posible inversión 

# ¿Cuál es la tienda más estable? (menos variación)

SELECT Store, STDDEV(Weekly_Sales) AS Desviacion_Ventas
FROM walmartdataset
GROUP BY Store
ORDER BY Desviacion_Ventas ASC
LIMIT 5;

# Entonces podemos observar que existen tiendas con mayores ingresos semanales
# promedio pero ninguna de esas tiendas se encuentra dentro de las 5 
# más estables.

## Ahora quiero identificar semanas anómalas, semanas con ventas inusualmente altas:

SELECT Store, Date, Weekly_Sales
FROM walmartdataset
WHERE Weekly_Sales > (
  SELECT AVG(Weekly_Sales) + 2 * STDDEV(Weekly_Sales)
  FROM walmartdataset
);

## Ahora voy a comparar feriados vs no feriados por tienda

SELECT Store, Holiday_Flag, AVG(Weekly_Sales) AS Promedio
FROM walmartdataset
GROUP BY Store, Holiday_Flag;

# tendríamos información para afirmar que las ventas aumentan los feriados

# RANKING MENSUAL O ANUAL POR TIENDA

SELECT Store, YEAR(Date) AS Año, MONTH(Date) AS Mes, SUM(Weekly_Sales) AS Total_Mensual
FROM walmartdataset
GROUP BY Store, Año, Mes
ORDER BY Total_Mensual DESC;


## Clasificación de tiendas por desempeño utilizando CASE

SELECT Store,
  AVG(Weekly_Sales) AS Promedio,
  CASE
    WHEN AVG(Weekly_Sales) > 2000000 THEN 'Alto'
    WHEN AVG(Weekly_Sales) > 1000000 THEN 'Medio'
    ELSE 'Bajo'
  END AS Categoria_Desempeño
FROM walmartdataset
GROUP BY Store;











