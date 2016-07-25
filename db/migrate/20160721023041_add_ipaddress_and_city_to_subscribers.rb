class AddIpaddressAndCityToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :ip_address, :string
    add_column :subscribers, :city, :string
  end
end
