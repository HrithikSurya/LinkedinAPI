class Status < ActiveRecord::Migration[7.0]
  def change
    remove_column :job_applications, :status
    add_column :job_applications, :status, :integer, null: false, default: 0
  end
end
