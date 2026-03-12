SELECT TOP (1000) *
  FROM [BikeStores].[sales].[staffs] s
  RIGHT OUTER JOIN [BikeStores].[sales].[stores] st
  ON s.store_id = st.store_id


