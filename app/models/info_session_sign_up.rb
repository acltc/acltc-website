class InfoSessionSignUp < ActiveRecord::Base
  belongs_to :info_session
  validates :name, :email, :phone, :city, presence: true

  def friendly_date
      if info_session
        info_session.date.strftime("%B %d, %Y")
      end
  end

  def friendly_time
    if info_session
      info_session.date.strftime("%I:%M %p")
    end
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |sign_up|
        if csv << sign_up.attributes.values_at(*column_names)
        end
      end
    end
  end
end
