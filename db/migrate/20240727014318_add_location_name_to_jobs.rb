class AddLocationNameToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :location_name, :string
  end
end
