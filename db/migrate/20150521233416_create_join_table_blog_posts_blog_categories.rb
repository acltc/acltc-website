class CreateJoinTableBlogPostsBlogCategories < ActiveRecord::Migration
  def change
    create_join_table :blog_posts, :blog_categories do |t|
      # t.index [:blog_post_id, :blog_category_id]
      # t.index [:blog_category_id, :blog_post_id]
    end
  end
end
