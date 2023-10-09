class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :sector
      t.string :location
      t.string :establishment

      t.timestamps
    end
  end
end
