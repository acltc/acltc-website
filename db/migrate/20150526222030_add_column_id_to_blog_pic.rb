class AddColumnIdToBlogPic < ActiveRecord::Migration
  def change
    add_column :blog_pics, :blog_post_id, :integer
  end
end
