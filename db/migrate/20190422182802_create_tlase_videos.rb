class CreateTlaseVideos < ActiveRecord::Migration
  def change
    create_table :tlase_videos do |t|
      t.integer :episode
      t.string :vimeo_url
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
