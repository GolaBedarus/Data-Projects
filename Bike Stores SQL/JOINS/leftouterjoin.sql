SELECT TOP (1000) *
  FROM [BikeStores].[sales].[stores] s
  LEFT OUTER JOIN [BikeStores].[sales].[staffs] st
  ON s.store_id = st.store_id 
