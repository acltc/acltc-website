class AddAdminToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :admin_id, :integer
  end
end
