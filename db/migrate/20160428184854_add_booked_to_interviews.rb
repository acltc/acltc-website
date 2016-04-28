class AddBookedToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :booked, :boolean, default: false
  end
end
