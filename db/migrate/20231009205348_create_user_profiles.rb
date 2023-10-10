class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    # drop_table :user_profiles

    create_table :user_profiles do |t|
      t.string :title
      t.string :designation
      t.string :experience
      t.string :qualification
      t.string :skill_set
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
