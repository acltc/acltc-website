class AddColumnToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :phone, :string
  end
end
