class RemoveLocationIdFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :location_id, :integer
  end
end
