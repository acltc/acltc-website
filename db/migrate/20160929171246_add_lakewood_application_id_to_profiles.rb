class AddLakewoodApplicationIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :lakewood_application_id, :integer
  end
end
