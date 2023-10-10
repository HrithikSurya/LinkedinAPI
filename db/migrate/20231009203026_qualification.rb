class Qualification < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role_id_id, :skill_set
    remove_column :users, :experience, :location
    remove_column :users, :designation, :qualification
  end
end
