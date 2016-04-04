class AddCohortToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :cohort, :string
  end
end
