class AddPostalCodeToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :postal_code, :string
  end
end
