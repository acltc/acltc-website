class InfoSession < ActiveRecord::Base
  before_destroy :send_cancelation_emails
  
  has_many :info_session_sign_ups, dependent: :delete_all

  def friendly_date
    date.strftime("%B %d, %Y")
  end

  def friendly_time
    date.strftime("%l:%M %p")
  end

  def self.current_sessions
    InfoSession.where("date >= ?", Time.now).order(date: :asc)
  end

  def self.current_info_session
    InfoSession.current_sessions.first
  end

  private
    
  def send_cancelation_emails    
    info_session_sign_ups.each do |sign_up|
      AcltcMailer.info_session_cancel(self, sign_up.email).deliver_now
    end
  end

end