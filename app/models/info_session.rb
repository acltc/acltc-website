class InfoSession < ActiveRecord::Base

  def index_date
    date.strftime("%B %d, %Y")
  end

  def index_time
    date.strftime("%I:%M %p")
  end

  def self.current_sessions
    InfoSession.where("date >= ?", Time.now).order(date: :asc)
  end

  def self.current_info_session
    InfoSession.current_sessions.first
  end

end
