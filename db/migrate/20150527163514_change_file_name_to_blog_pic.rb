class ChangeFileNameToBlogPic < ActiveRecord::Migration
  def change
    remove_column :blog_pics, :file_name, :string
    add_column :blog_pics, :blog_pic, :string
  end
end
