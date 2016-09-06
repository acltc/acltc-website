class CorporateTrainingMessage < ActiveRecord::Base
  has_and_belongs_to_many :field_of_interests, dependent: :destroy
end
