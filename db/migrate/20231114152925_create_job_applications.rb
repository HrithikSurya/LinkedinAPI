class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.belongs_to :job_profile
      t.belongs_to :user_profile
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
