class AddMoreColumnsToCorporateTrainingMessages < ActiveRecord::Migration
  def change
    add_column :corporate_training_messages, :company_contact_title, :string
    add_column :corporate_training_messages, :address_1, :string
    add_column :corporate_training_messages, :address_2, :string
    add_column :corporate_training_messages, :company_city, :string
    add_column :corporate_training_messages, :state, :string
    rename_column :corporate_training_messages, :rep_name, :company_contact

  end
end
