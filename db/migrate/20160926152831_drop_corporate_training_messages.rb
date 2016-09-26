class DropCorporateTrainingMessages < ActiveRecord::Migration
  def change
    drop_table :corporate_training_messages
  end
end
