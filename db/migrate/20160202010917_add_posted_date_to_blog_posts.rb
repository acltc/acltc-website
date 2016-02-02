class AddPostedDateToBlogPosts < ActiveRecord::Migration
  def up
    add_column :blog_posts, :posted_date, :date
    BlogPost.all.each do |blog_post|
      blog_post.update(posted_date: blog_post.updated_at)
    end
  end

  def down
    remove_column :blog_posts, :posted_date, :date
  end
end
