class AddTimeToReachToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :time_to_reach, :string
  end
end
