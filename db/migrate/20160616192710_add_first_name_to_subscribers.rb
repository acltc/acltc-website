class AddFirstNameToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :first_name, :string
    add_column :subscribers, :mousetrap, :string
  end
end
