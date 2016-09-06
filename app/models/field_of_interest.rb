class FieldOfInterest < ActiveRecord::Base
  has_and_belongs_to_many :corporate_training_messages

  validates :name, presence: true
end
