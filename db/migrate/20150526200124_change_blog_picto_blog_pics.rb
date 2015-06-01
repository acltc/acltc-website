class ChangeBlogPictoBlogPics < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :blog_pic, :string
    add_column :blog_posts, :blog_pics, :json
  end
end
