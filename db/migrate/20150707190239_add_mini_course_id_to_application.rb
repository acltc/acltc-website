class AddMiniCourseIdToApplication < ActiveRecord::Migration
  def change
    add_column :mini_course_applications, :mini_course_id, :integer
  end
end
