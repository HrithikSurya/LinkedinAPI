class CreateJobProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :job_profiles do |t|
      t.string :title
      t.string :job_description
      t.string :no_of_openings
      t.string :requirement
      t.string :skills_required
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
