class AddHangoutsEmailToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :hangouts_email, :string
  end
end
