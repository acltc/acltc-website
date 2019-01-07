class AddClassicToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :classic, :boolean, default: false
  end
end
