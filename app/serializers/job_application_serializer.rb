class JobApplicationSerializer
  include JSONAPI::Serializer
  attributes :id, :job_profile_id, :user_profile_id, :status
end
