class CreateK12Contacts < ActiveRecord::Migration
  def change
    create_table :k12_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
