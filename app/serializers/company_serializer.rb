class CompanySerializer
  include JSONAPI::Serializer
  attributes :user_id, :company_name, :sector, :location, :establishment
end
