class MiniCourse < ActiveRecord::Base
  belongs_to :location
  has_many :mini_course_applications

  def course_dates
    "#{start_date.strftime("%m/%d/%Y")} - #{end_date.strftime("%m/%d/%Y")}"
  end
end
