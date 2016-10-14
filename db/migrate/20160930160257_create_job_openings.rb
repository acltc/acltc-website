class CreateJobOpenings < ActiveRecord::Migration
  def change
    create_table :job_openings do |t|
      t.string :title
      t.string :location
      t.string :salary
      t.text :description

      t.timestamps null: false
    end
  end
end
