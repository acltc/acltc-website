class DropApplicationsLocations < ActiveRecord::Migration
  def change
    drop_table :applications_locations
  end
end
