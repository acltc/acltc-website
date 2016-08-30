class AddApplicationIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :application_id, :integer
  end
end
