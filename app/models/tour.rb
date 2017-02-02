class Tour < ActiveRecord::Base
  belongs_to :interview
  
  # validates :interview_id, presence: true, uniqueness: true, on: :create
  # validates :city, :first_name, :last_name, :email, :phone, presence: true

  validates :interview_id, presence: true, uniqueness: true, on: :create, if: :split_test? 
  # validates :interview_id, presence: true, uniqueness: true, unless: Proc.new{ |tour| tour.interview_id } 
  validates :first_name, :email, :phone, presence: true
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def self.split_test?
    @tour_split_test == "Book A Tour Long Form"
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
