class Application < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc,
  :location, :hangouts_email, presence: true, on: :create

  validates :interview_id, presence: true, uniqueness: true, on: :create

  validates :primary_goals, :programming_experience, :current_occupation, :preferred_work_location, :work_concurrently, :why_better, :tinker_example, presence: true, on: :create

  has_many :statuses
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

  def self.has_month_and_status(month_number, year, status)
    self.joins(:statuses).where("applications.created_at >= '#{Date.new(year, month_number, 1)}' AND applications.created_at < '#{Date.new(year, month_number, 1) + 1.month}' AND statuses.text = '#{status}'")
  end

  def self.has_month(month_number, year)
    self.where("created_at >= '#{Date.new(year, month_number, 1)}' AND created_at < '#{Date.new(year, month_number, 1) + 1.month}'")
  end

end
