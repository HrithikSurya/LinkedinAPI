class Droptable < ActiveRecord::Migration[7.0]
  def change
    drop_table :job_profiles_user_profiles
  end
end
