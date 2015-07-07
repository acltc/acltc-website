class RemoveResumeFromMiniCourseApplications < ActiveRecord::Migration
  def change
    remove_column :mini_course_applications, :resume, :string
  end
end
