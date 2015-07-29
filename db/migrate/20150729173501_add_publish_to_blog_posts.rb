class AddPublishToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :published?, :boolean
  end
end
