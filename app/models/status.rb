class Status < ActiveRecord::Base
  belongs_to :application
  belongs_to :lakewood_application
end
