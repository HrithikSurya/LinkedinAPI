json.array! @companies do |company|
  json.id company.id
  json.company_name company.company_name
  json.sector company.sector
  json.location company.location
  json.establishment company.establishment
end
