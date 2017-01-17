class InfoSessionSignUp < ActiveRecord::Base
  validates :name, :email, :phone, :city, presence: true

  def friendly_date
    date.strftime("%B %d, %Y")
  end

  def friendly_time
    date.strftime("%I:%M %p")
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end
end
