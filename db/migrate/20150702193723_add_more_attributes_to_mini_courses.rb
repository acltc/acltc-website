class AddMoreAttributesToMiniCourses < ActiveRecord::Migration
  def change
    add_column :mini_courses, :description, :text
    add_column :mini_courses, :skills_learned, :text
    add_column :mini_courses, :prerequisites, :text
  end
end
