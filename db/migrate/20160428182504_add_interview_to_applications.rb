class AddInterviewToApplications < ActiveRecord::Migration
  def change
    add_reference :applications, :interview, index: true
    add_foreign_key :applications, :interviews
  end
end
