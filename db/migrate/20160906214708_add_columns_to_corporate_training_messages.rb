class AddColumnsToCorporateTrainingMessages < ActiveRecord::Migration
  def change
    rename_column :corporate_training_messages, :name, :company_name
    add_column :corporate_training_messages, :rep_name, :string
  end
end
