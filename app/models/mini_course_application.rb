class MiniCourseApplication < ActiveRecord::Base
  belongs_to :mini_course

  def full_name
    "#{first_name} #{last_name}"
  end

  def mini_course_applications_human_time
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end
