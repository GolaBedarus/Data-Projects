SELECT category_id, AVG(list_price)
  FROM [BikeStores].[production].[products]
  GROUP BY category_id
  HAVING AVG(list_price) > 700
