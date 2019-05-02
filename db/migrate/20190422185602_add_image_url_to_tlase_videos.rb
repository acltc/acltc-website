class AddImageUrlToTlaseVideos < ActiveRecord::Migration
  def change
    add_column :tlase_videos, :image_url, :string
  end
end
