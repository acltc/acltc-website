class CreateAppreciations < ActiveRecord::Migration
  def change
    create_table :appreciations do |t|
      t.string :name
      t.text :post

      t.timestamps null: false
    end
  end
end
