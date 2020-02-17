class AddSessionIdToEnrollment < ActiveRecord::Migration
  def change
    add_column :coding_foundations_enrollments, :session_id, :string
  end
end
