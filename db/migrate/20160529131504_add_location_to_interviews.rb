class AddLocationToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :location, :integer
  end
end
