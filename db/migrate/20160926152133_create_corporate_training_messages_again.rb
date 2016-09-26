class CreateCorporateTrainingMessagesAgain < ActiveRecord::Migration
  def change
    create_table :corporate_training_messages do |t|
      t.string :company_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_title
      t.string :contact_email
      t.string :contact_phone
      t.string :training_city
      t.string :training_state
      t.string :team_size
      t.date :start_date
      t.text :message
    end
  end
end
