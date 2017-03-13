class Application < ActiveRecord::Base

   validates :first_name, :last_name, :email, :phone, :address, :learn_about_acltc, :location, :primary_goals, :programming_experience, :current_occupation, :preferred_work_location, :work_concurrently, :why_better, :tinker_example, presence: true, on: :create

#   validates :primary_goals, :programming_experience, :current_occupation, :preferred_work_location, :work_concurrently, :why_better, :tinker_example, presence: true, on: :create


  has_many :statuses
  has_one :profile

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
