class RemoveUser < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_profile
  end
end
