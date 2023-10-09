class Changes < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role_id, :skill_set
    remove_column :users, :experience, :location
    remove_column :users, :designation, :qualification

    create_table :user_profile, force: true do |t|
      t.string 'name'
      t.references 'user_id', null: false, foreign_key: true
      t.string 'title'
      t.string 'experience'
      t.string 'qualification'
      t.string 'designation'
      t.string 'location'
    end

    # add_foreign_key "user_id", "user_profile"
  end
end
