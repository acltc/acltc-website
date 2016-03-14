class Application < ActiveRecord::Base
  has_and_belongs_to_many :locations
  validates :legal_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc, :current_occupation, :locations, :primary_goals, :programming_experience, :preferred_work_location, :capstone_idea, :work_concurrently, :tinker_example, :why_better,  presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def applications_human_time
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end
