class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.string "candidate"
      t.string "company"
      t.string "skills_matching_percentage"

      t.timestamps
    end
  end
end
