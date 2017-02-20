class Subscriber < ActiveRecord::Base

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, :email, :phone, presence: true

  def self.to_csv(options = {})    
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |subscriber|
        csv << subscriber.attributes.values_at(*column_names)
      end
    end
  end

end
