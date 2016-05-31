class Interview < ActiveRecord::Base
  has_one :application, foreign_key: :interview_id
  validates :starts_at, presence: true
  validates :starts_at, uniqueness: {scope: :location}
  validates :location, presence: true, on: :create

  def interview_date_human
    starts_at.strftime("%A, %B %d, %Y %l:%M %P %Z")
  end

  def interview_time_zone (zone)
    if zone == "Chicago"
      starts_at.strftime("%A, %B %d, %Y %l:%M %P %Z")
    elsif zone == "New York City"
      starts_at.in_time_zone('Eastern Time (US & Canada)').strftime("%A, %B %d, %Y %l:%M %P %Z")
    elsif zone == "San Francisco"
      starts_at.in_time_zone('Pacific Time (US & Canada)').strftime("%A, %B %d, %Y %l:%M %P %Z")
    end
  end
end
