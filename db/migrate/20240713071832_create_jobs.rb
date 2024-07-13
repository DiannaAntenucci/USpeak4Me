class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :job_category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
