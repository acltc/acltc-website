class CreateJoinTableMiniCourseLocation < ActiveRecord::Migration
  def change
    create_join_table :mini_courses, :locations do |t|
      # t.index [:mini_course_id, :location_id]
      # t.index [:location_id, :mini_course_id]
    end
  end
end
