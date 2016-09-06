class CreateJoinTableCorporateTrainingMessageFieldOfInterest < ActiveRecord::Migration
  def change
    create_join_table :corporate_training_messages, :field_of_interests do |t|
      # t.index [:corporate_training_message_id, :field_of_interest_id]
      # t.index [:field_of_interest_id, :corporate_training_message_id]
    end
  end
end
