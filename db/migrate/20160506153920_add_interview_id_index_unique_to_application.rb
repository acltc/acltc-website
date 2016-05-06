class AddInterviewIdIndexUniqueToApplication < ActiveRecord::Migration
  def change
    remove_index :applications, column: :interview_id
    add_index :applications, :interview_id, unique: true
  end
end
