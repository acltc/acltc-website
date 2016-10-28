class RemoveJobOpeningsTable < ActiveRecord::Migration
  def change
    drop_table :job_openings
  end
end
