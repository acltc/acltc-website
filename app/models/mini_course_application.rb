class MiniCourseApplication < ActiveRecord::Base
  belongs_to :mini_course

  def full_name
    "#{first_name} #{last_name}"
  end
end
