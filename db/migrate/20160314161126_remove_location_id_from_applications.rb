class RemoveLocationIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :location_id, :integer
  end
end
