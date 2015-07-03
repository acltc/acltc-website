class Contact < ActiveRecord::Base
  has_and_belongs_to_many :locations

  def full_name
    "#{first_name} #{last_name}"
  end
end
