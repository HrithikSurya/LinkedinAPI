class UserProfileSerializer
  include JSONAPI::Serializer
  attributes :title, :designation, :experience, :qualification, :skill_set, :location, :user_id
end
