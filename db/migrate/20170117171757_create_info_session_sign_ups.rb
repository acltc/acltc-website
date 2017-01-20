class CreateInfoSessionSignUps < ActiveRecord::Migration
  def change
    create_table :info_session_sign_ups do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :city
      t.date :datetime

      t.timestamps null: false
    end
  end
end
