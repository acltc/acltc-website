class Tour < ActiveRecord::Base
  belongs_to :interview
  
  # validates :interview_id, presence: true, uniqueness: true, on: :create
  # validates :city, :first_name, :last_name, :email, :phone, presence: true
  validates :first_name, :email, :phone, presence: true
  
  def full_name
    "#{first_name} #{last_name}"
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
