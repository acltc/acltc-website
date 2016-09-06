class CorporateTrainingMessage < ActiveRecord::Base
  has_and_belongs_to_many :field_of_interests, dependent: :destroy

  validates :company_name, :rep_name, :email, :phone, :team_size, :date, :city, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def friendly_start_date
    date.strftime("%b %d, %Y")
  end
end
