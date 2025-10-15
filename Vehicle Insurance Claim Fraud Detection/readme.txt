
PROYECTO: Detección de Fraude en Reclamos de Seguros de Vehículos - Power BI
Autor: Galo Badaro
Fuente de datos: https://www.kaggle.com/datasets/shivamb/vehicle-claim-fraud-detection

-----------------------------------------------------
DESCRIPCIÓN DEL PROYECTO
-----------------------------------------------------
Este dashboard tiene como objetivo analizar patrones de fraude en reclamos de seguros de vehículos, 
utilizando visualizaciones interactivas en Power BI. El dataset original proviene de Kaggle (autor: 
Shivam Bansal) y contiene más de 15 mil de reclamos simulados.

-----------------------------------------------------
KPIs PRINCIPALES
-----------------------------------------------------
- Número total de reclamos: 15 mil
- Reclamos fraudulentos: 923
- Tasa de fraude: 5,99 %

Aunque el porcentaje parece bajo, su impacto económico potencial es significativo.

-----------------------------------------------------
ANÁLISIS DEMOGRÁFICO
-----------------------------------------------------
- Género: el 88,6% de los fraudes fueron cometidos por hombres, frente al 11,4% por mujeres.
- Estado civil: los fraudes son ligeramente más frecuentes entre personas divorciadas (96,2%) 
  y solteras (94,4%).
- Edad: el grupo etario de 31 a 35 años concentra la mayor cantidad de reclamos fraudulentos (360 casos).

-----------------------------------------------------
ANÁLISIS DE VEHÍCULOS
-----------------------------------------------------
Top 5 fabricantes con mayor número de fraudes:
1. Pontiac
2. Toyota
3. Honda
4. Mazda
5. Chevrolet

Los vehículos tipo “Sedan” concentran la mayoría de los fraudes, seguidos por “Sport” y “Utility”.

-----------------------------------------------------
TIPO DE PÓLIZA Y TASA DE FRAUDE
-----------------------------------------------------
- Sport - Collision: 13,79 %
- Utility - All Perils: 12,06 %
- Sedan - All Perils: 10,06 %
- Utility - Collision: 10,00 %
- Sedan - Collision: 6,88 %
- Sedan - Liability: 0,72 %

Las pólizas de tipo Sport y Utility presentan mayor vulnerabilidad al fraude, posiblemente 
por el costo de las reparaciones o los daños reclamados.

-----------------------------------------------------
EDAD Y PRECIO DEL VEHÍCULO
-----------------------------------------------------
- Los fraudes se concentran en vehículos con más de 6 años de antigüedad.
- También se observan más fraudes en autos valuados entre 40.000 y 60.000, y más de 69.000.

Esto sugiere que los vehículos más antiguos y de gama media-alta son más propensos 
a ser involucrados en reclamos fraudulentos.

-----------------------------------------------------
CONCLUSIONES
-----------------------------------------------------
El análisis permitió identificar los perfiles y patrones más frecuentes asociados al fraude:
- Mayor incidencia en hombres jóvenes (31-35 años), principalmente solteros o divorciados.
- Vehículos más antiguos y de categoría Sedan o Sport.
- Pólizas tipo “Collision” y “All Perils” presentan mayor riesgo.

Este tipo de análisis ayuda a las aseguradoras a:
1. Detectar combinaciones de riesgo.
2. Optimizar auditorías y controles.
3. Prevenir pérdidas mediante modelos predictivos de fraude.

-----------------------------------------------------
FIN DEL DOCUMENTO
-----------------------------------------------------
