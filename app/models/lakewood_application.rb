class LakewoodApplication < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc, presence: true, on: :create

  validates :primary_goals, :programming_experience, :why_better, :tinker_example, :proficiency_with_computers_and_technology, presence: true,  on: :create
  validates :primary_goals, :why_better, :tinker_example,length: { minimum: 140 }, on: :create

  has_many :statuses
  has_one :lakewood_profile

  def full_name
    "#{first_name} #{last_name}"
  end

  def applications_human_time
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
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
