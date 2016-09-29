class AddColumnToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :lakewood_application_id, :integer
  end
end
