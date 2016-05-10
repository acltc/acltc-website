class Application < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc,
  :location, :primary_goals, :programming_experience, :tinker_example, :hangouts_email, presence: true, on: :create
  validates :interview_id, presence: true, uniqueness: true, on: :create

  validates :current_occupation, :preferred_work_location, :work_concurrently, :why_better, presence: true, on: :create, unless: Proc.new { |m| m.hidden == 'short' }

  attr_accessor :hidden
  attr_accessor :subtitle #virtual attribute to prevent spam via the invisible_captcha gem
  validates :subtitle, :invisible_captcha => true

  belongs_to :interview

  def full_name
    "#{first_name} #{last_name}"
  end

  def applications_human_time
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def self.conversion_rate_long_form
    a = SimpleAbs::Alternative.first
    a.conversions.to_f / a.participants.to_f * 100
  end

  def self.conversion_rate_short_form
    a = SimpleAbs::Alternative.second
    a.conversions.to_f / a.participants.to_f * 100
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
