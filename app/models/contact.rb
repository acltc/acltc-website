class Contact < ActiveRecord::Base

  validates :message, format: { without: /href=/, message: "You're a spambot!" }

  def full_name
    "#{first_name} #{last_name}"
  end

  def contacts_human_time
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end
