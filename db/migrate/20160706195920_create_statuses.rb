class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :text
      t.date :date
      t.integer :application_id

      t.timestamps null: false
    end
  end
end
