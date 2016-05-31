class ChangeLocationToLocationIdInInterviews < ActiveRecord::Migration
  def change
    remove_column :interviews, :location, :integer
    add_column :interviews, :location_id, :integer
  end
end
