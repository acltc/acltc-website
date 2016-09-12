class CorporateTrainingMessage < ActiveRecord::Base
  has_and_belongs_to_many :field_of_interests, dependent: :destroy

  validates :company_name, :company_contact, :company_contact_title, :email, :phone, :team_size, :date, :training_location, :address_1, :company_city, :state, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def friendly_start_date
    date.strftime("%b %d, %Y")
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
