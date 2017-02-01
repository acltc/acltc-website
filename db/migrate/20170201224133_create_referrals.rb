class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :referrer_first_name
      t.string :referrer_last_name
      t.string :referrer_email
      t.string :referrer_phone_number
      t.string :referred_first_name
      t.string :referred_email

      t.timestamps null: false
    end
  end
end
