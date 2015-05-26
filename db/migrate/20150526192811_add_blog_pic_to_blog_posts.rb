class AddBlogPicToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :blog_pic, :string
  end
end
