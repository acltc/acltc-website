class CodingFoundationsEnrollment < ActiveRecord::Base
  validates :first_name, :email, :phone_number, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
