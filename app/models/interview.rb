class Interview < ActiveRecord::Base
  has_one :application, foreign_key: :interview_id

  def interview_date_human
    starts_at.strftime("%B %d, %Y %l:%M %P")
  end
end
