class Application < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc,
  :current_occupation, :location, :primary_goals, :programming_experience, :preferred_work_location,
  :work_concurrently, :tinker_example, :why_better, :hangouts_email, presence: true, on: :create
  validates :interview_id, presence: true, uniqueness: true, on: :create

  attr_accessor :subtitle #virtual attribute to prevent spam via the invisible_captcha gem
  validates :subtitle, :invisible_captcha => true

  belongs_to :interview

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
