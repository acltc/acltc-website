class AddPriorityToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :priority, :integer, default: 100
  end
end
