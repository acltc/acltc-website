class ChangeCategoryColumnName < ActiveRecord::Migration
  def change
    rename_column :blog_categories, :category, :name
  end
end
