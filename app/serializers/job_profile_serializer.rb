class JobProfileSerializer
  include JSONAPI::Serializer
  attributes :title, :job_description, :no_of_openings, :requirement, :skills_required, :company_id
end
