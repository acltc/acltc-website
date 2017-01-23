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
      info_session.date.strftime("%l:%M %p")
    end
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end

  def self.to_csv(options = {})
    csv_columns = ["id", "name", "email", "phone", "city", "created_at", "updated_at", "info_session_id", "session_date", "session_time"]
    CSV.generate(options) do |csv|
      csv << csv_columns
      all.each do |sign_up|
        temp = sign_up.attributes.values_at(*csv_columns)
        if sign_up.info_session
          temp[-2] = sign_up.info_session.friendly_date
          temp[-1] = sign_up.info_session.friendly_time
        else
          temp[-2] = "session canceled"
          temp[-1] = "session canceled"
        end
        csv << temp
      end
    end
  end
end