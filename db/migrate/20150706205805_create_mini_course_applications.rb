class CreateMiniCourseApplications < ActiveRecord::Migration
  def change
    create_table :mini_course_applications do |t|
      t.string :first_name
      t.string :last_name
      t.text :statement
      t.string :resume

      t.timestamps null: false
    end
  end
end
