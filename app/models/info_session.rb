class InfoSession < ActiveRecord::Base

  def index_date
    date.strftime("%B %d, %Y")
  end

  def index_time
    date.strftime("%I:%M %p")
  end

  def self.current_sessions
    InfoSession.where("date >= ?", Time.now)
  end

end
