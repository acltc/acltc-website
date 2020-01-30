class CreateCodingFoundationsEnrollments < ActiveRecord::Migration
  def change
    create_table :coding_foundations_enrollments do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
