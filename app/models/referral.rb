class Referral < ActiveRecord::Base
  validates :referrer_first_name, :referrer_last_name, :referrer_email, :referrer_phone_number, :referred_first_name, :referred_email, presence: true

  # REFACTOR
  def self.to_csv
    attributes = %w{formatted_date full_name referrer_email referrer_phone_number referred_first_name referred_email}
    headers = ["Date", "Referrer Full Name", "Referrer Email", "Referrer Phone Number", "Referred First Name", "Referred Email"]
    CSV.generate do |csv|
      csv << headers

      all.each do |referral|
        csv << attributes.map{ |attr| referral.send(attr) }
      end
    end
  end

  def full_name
    "#{referrer_first_name} #{referrer_last_name}"
  end

  def formatted_date
    created_at.strftime("%m/%d/%Y")
  end
end
