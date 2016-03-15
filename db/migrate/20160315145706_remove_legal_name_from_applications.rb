class RemoveLegalNameFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :legal_name, :string
  end
end
