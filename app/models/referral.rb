class Referral < ActiveRecord::Base
  validates :referrer_first_name, :referrer_last_name, :referrer_email, :referrer_phone_number, :referred_first_name, :referred_email, presence: true
end
