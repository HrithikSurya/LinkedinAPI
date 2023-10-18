class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :job_profiles, :user_profiles do |t|
      t.index [:job_profile_id, :user_profile_id], name: 'job_on_users'
      # t.index [:user_profile_id, :job_profile_id]
    end
  end
end
