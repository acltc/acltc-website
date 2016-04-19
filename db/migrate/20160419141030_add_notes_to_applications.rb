class AddNotesToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :notes, :text
  end
end
