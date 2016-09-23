class AddFirstNameLastNameToCorporateTraining < ActiveRecord::Migration
  def change
    rename_column :corporate_training_messages, :company_contact, :first_name
    add_column :corporate_training_messages, :last_name, :string
  end
end
