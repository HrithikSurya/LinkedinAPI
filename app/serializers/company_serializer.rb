class CompanySerializer
  include JSONAPI::Serializer
  attributes :company_name, :sector, :location, :establishment
end
