class Location < ActiveRecord::Base
  has_and_belongs_to_many :applications
  has_and_belongs_to_many :contacts
  has_many :mini_courses
end
