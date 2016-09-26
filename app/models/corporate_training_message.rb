class CorporateTrainingMessage < ActiveRecord::Base
  has_and_belongs_to_many :field_of_interests, dependent: :destroy

  validates :company_name, :contact_first_name, :contact_last_name, :contact_title, :contact_email, :contact_phone, :team_size, :start_date, :training_city, :training_state, :address_1, :city, :state, presence: true
  validates :contact_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  # validates :contact_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def friendly_start_date
    start_date.strftime("%b %d, %Y")
  end

  def full_name
    "#{contact_first_name} #{contact_last_name}"
  end

  def training_location
    "#{training_city}, #{training_state}"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |application|
        csv << application.attributes.values_at(*column_names)
      end
    end
  end
end
