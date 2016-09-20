class AddCategoryToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :category, :string
  end
end
