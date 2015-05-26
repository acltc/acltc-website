class CreateBlogPics < ActiveRecord::Migration
  def change
    create_table :blog_pics do |t|

      t.timestamps null: false
    end
  end
end
