class AddFileNameToBlogPic < ActiveRecord::Migration
  def change
    add_column :blog_pics, :file_name, :string
  end
end
