class MakeBlogPicsFromArrayToSeperateModel < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :blog_pics, :text, array:true, default: []
  end
end
