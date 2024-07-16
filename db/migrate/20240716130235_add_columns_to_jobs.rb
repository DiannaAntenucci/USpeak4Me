class AddColumnsToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :date, :datetime
    add_column :jobs, :price, :integer
    add_column :jobs, :urgency, :integer
    add_column :jobs, :address, :string
    add_column :jobs, :description, :text
  end
end
