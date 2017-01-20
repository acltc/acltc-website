class InfoSession < ActiveRecord::Base
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

end