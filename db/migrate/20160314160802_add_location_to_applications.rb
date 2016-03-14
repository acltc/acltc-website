class AddLocationToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :location, :string
  end
end
