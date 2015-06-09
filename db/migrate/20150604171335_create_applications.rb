class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.references :location, index: true
      t.text :learn_about_acltc
      t.text :current_occupation
      t.text :primary_goals
      t.text :programming_experience
      t.string :preferred_work_location
      t.text :capstone_idea
      t.text :work_concurrently
      t.text :tinker_example
      t.text :why_better

      t.timestamps null: false
    end
    add_foreign_key :applications, :locations
  end
end
