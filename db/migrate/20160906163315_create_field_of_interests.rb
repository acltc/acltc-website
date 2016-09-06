class CreateFieldOfInterests < ActiveRecord::Migration
  def change
    create_table :field_of_interests do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
