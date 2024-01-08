@company && ( 
  json.extract! @company, :id, :company_name, :sector, :location, :establishment
  ) || ( 
  json.extract! @company, :errors
  )
