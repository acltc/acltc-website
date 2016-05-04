class Interview < ActiveRecord::Base
  has_one :application, foreign_key: :interview_id
  validates :starts_at, presence: true, uniqueness: true

  def interview_date_human
    starts_at.strftime("%A, %B %d, %Y %l:%M %P %Z")
  end
end
