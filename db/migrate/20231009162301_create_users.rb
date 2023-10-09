class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :qualification
      t.string :designation
      t.string :location
      t.string :role
      t.string :experience
      t.string :skill_set

      t.timestamps
    end
  end
end
