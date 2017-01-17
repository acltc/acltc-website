class InfoSessionSignUp < ActiveRecord::Base
  validates :name, :email, :phone, :city, presence: true

  def index_date
    date.strftime("%B %d, %Y")
  end

  def index_time
    date.strftime("%I:%M %p")
  end
end
