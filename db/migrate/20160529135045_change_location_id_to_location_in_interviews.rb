class ChangeLocationIdToLocationInInterviews < ActiveRecord::Migration
  def change
    remove_column :interviews, :location_id, :integer
    add_column :interviews, :location, :string
  end
end
