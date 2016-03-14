class DropContactsLocations < ActiveRecord::Migration
  def change
    drop_table :contacts_locations
  end
end
