class RemoveColumnSkill < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :skill_set
    remove_foreign_key 'user_profile', 'user_ids'
  end
end
