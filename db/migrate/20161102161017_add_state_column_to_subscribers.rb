class AddStateColumnToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :state, :string
  end
end
