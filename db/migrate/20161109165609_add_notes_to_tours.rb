class AddNotesToTours < ActiveRecord::Migration
  def change
    add_column :tours, :notes, :text
  end
end
