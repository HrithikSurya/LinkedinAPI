class Defaulttojobprofiles < ActiveRecord::Migration[7.0]
  def change 
    change_column :job_profiles, :company_id, :integer, default: 0
  end
end
