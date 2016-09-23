class AddTrainingCityAndState < ActiveRecord::Migration
  def change
    rename_column :corporate_training_messages, :training_location, :training_city
    add_column :corporate_training_messages, :training_state, :string
  end
end
