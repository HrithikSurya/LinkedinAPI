class SuggestionSerializer
  include JSONAPI::Serializer
  attributes :candidate, :company, :skills_matching_percentage
end