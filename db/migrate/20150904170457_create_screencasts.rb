class CreateScreencasts < ActiveRecord::Migration
  def change
    create_table :screencasts do |t|
      t.string :cover_image
      t.string :youtube_id
      t.string :name
      t.text :description
      t.integer :priority

      t.timestamps null: false
    end
  end
end
