class AddAcltcSpecifyToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :learn_about_acltc_specify, :text
  end
end
