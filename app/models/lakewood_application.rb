class LakewoodApplication < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, :address, :emergency_contact, :learn_about_acltc, :currently_a_student, :currently_employed, presence: true, on: :create
  validates :primary_goals, :programming_experience, :why_better, :tinker_example, :proficiency_with_computers_and_technology, presence: true,  on: :create
  validates :primary_goals, :why_better, :tinker_example,length: { minimum: 140 }, on: :create
  validates :student_part_or_full_time, :institution_name, :institution_city, :institution_state, :institution_zip, :student_concurrently, presence: true, :if => "currently_a_student == 'Yes'"
  validates :employed_part_or_full_time, :employer_name, :employer_city, :employer_state, :employer_zip, :employed_concurrently, presence: true, :if => "currently_employed == 'Yes'"

  has_many :statuses
  has_one :lakewood_profile

  def full_name
    "#{first_name} #{last_name}"
  end

  def applications_human_time
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def institution_location
    if currently_a_student = "Yes"
      "#{institution_city}, #{institution_state}, #{institution_zip}"
    end
  end

  def employer_location
    if currently_employed = "Yes"
      "#{employer_city}, #{employer_state}, #{employer_zip}"
    end
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
