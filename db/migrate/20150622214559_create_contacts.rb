class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :subject
      t.integer :location_id
      t.text :message

      t.timestamps null: false
    end
  end
end
