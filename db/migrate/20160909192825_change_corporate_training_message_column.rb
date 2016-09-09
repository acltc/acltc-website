class ChangeCorporateTrainingMessageColumn < ActiveRecord::Migration
  def change
    rename_column :corporate_training_messages, :city, :training_location
  end
end
