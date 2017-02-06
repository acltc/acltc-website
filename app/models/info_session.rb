class InfoSession < ActiveRecord::Base

  before_destroy :send_cancelation_emails

  has_many :info_session_sign_ups

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

  def self.next_info_session
    InfoSession.where("date >= ?", (Time.now + 1.day)).order(date: :asc).first
  end

  def self.current_sign_ups
    current_session_ids = current_sessions.pluck(:id)
    InfoSessionSignUp.where(info_session_id: current_session_ids)
  end

  def self.chicago_sign_ups
    current_sign_ups.where(city: "Chicago")
  end

  def self.nyc_sign_ups
    current_sign_ups.where(city: "New York City")
  end

  def self.sf_sign_ups
    current_sign_ups.where(city: "San Francisco")
  end

  private
    
  def send_cancelation_emails    
    info_session_sign_ups.each do |sign_up|
      AcltcMailer.info_session_cancel(self, sign_up.email).deliver_now
    end
  end

end