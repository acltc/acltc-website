class K12Contact < ActiveRecord::Base
  validates :first_name, :last_name, :email, :message, presence: true
end
