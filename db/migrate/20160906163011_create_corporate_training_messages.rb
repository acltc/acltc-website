class CreateCorporateTrainingMessages < ActiveRecord::Migration
  def change
    create_table :corporate_training_messages do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :team_size
      t.date :date
      t.string :city

      t.timestamps null: false
    end
  end
end
