class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :city
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :interview_id

      t.timestamps null: false
    end
  end
end
