class Subscriber < ActiveRecord::Base

  validates :first_name, :email, :phone, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :phone, format: { with: /\A\d{3}-\d{3}-\d{4}\z/, on: :create }
  # validates :phone, format: { with: /\A[+1]\d{11}\z/}, on: :create } length: {is: 12, message: "number must be 10 digits long in xxxxxxxxxx format, no dashes or parenthesis."}
  validates :phone, format: { with: /\A[+1]\d{11}\z/, message: "number must be 10 digits long in xxxxxxxxxx format, no dashes or parenthesis.", on: :create}

  def self.to_csv(options = {})    
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |subscriber|
        csv << subscriber.attributes.values_at(*column_names)
      end
    end
  end

end
