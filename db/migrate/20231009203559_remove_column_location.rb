class RemoveColumnLocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :qualification
    remove_column :users, :location
  end
end
