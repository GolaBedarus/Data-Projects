USE retaildataproject;

## Debido a un error de importación de caracteres por formato CSV de excel
## El nombre de la columna "Store" se importó de manera erronea 
## pero me interesa corregir este error a través de las siguientes consultas:

ALTER TABLE salesdataset
CHANGE COLUMN `ï»¿Store` Store INT;

DESCRIBE salesdataset;

ALTER TABLE storesdataset
CHANGE COLUMN `ï»¿Store` Store INT;

DESCRIBE storesdataset;

ALTER TABLE featuresdataset
CHANGE COLUMN `ï»¿Store` Store INT;

DESCRIBE featuresdataset;

## Ahora lo que voy a hacer es unir las tres tablas

SELECT *
FROM salesdataset s
JOIN featuresdataset f ON s.Store = f.Store AND s.Date = f.Date
JOIN storesdataset st ON s.Store = st.Store;

## Ahora calculo el promedio de ventas semanales por tipo de tienda 

SELECT st.Type, ROUND(AVG(s.Weekly_Sales), 2) AS Promedio_Ventas
FROM salesdataset s
JOIN storesdataset st ON s.Store = st.Store
GROUP BY st.Type
ORDER BY Promedio_Ventas DESC;

## Promedio de venta por departamento 

SELECT 
    Dept,
    ROUND(AVG(Weekly_Sales), 2) AS Promedio_Ventas
FROM salesdataset
GROUP BY Dept
ORDER BY Promedio_Ventas DESC;

##Relación entre el precio de combustible y ventas

SELECT f.Fuel_Price, ROUND(AVG(s.Weekly_Sales), 2) AS Promedio_Ventas
FROM salesdataset s
JOIN featuresdataset f ON s.Store = f.Store AND s.Date = f.Date
GROUP BY f.Fuel_Price
ORDER BY Promedio_Ventas DESC
LIMIT 5;

## Relacion entre temperatura y ventas

SELECT 
    f.Temperature,
    AVG(s.Weekly_Sales) AS Promedio_Ventas
FROM salesdataset s
JOIN featuresdataset f ON s.Store = f.Store AND s.Date = f.Date
GROUP BY f.Temperature
ORDER BY f.Temperature;


## Ventas en Feriados vs No feriados 

SELECT s.IsHoliday, ROUND(AVG(s.Weekly_Sales), 2) AS Promedio_Ventas
FROM salesdataset s
GROUP BY s.IsHoliday;

## MARKDOWN total y su relacion con ventas

SELECT 
    s.Store,
    s.Date,
    (f.MarkDown1 + f.MarkDown2 + f.MarkDown3 + f.MarkDown4 + f.MarkDown5) AS Total_Markdown,
    s.Weekly_Sales
FROM salesdataset s
JOIN featuresdataset f ON s.Store = f.Store AND s.Date = f.Date
ORDER BY Total_Markdown DESC;














