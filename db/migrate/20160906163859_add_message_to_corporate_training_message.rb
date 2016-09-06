class AddMessageToCorporateTrainingMessage < ActiveRecord::Migration
  def change
    add_column :corporate_training_messages, :message, :text
  end
end
