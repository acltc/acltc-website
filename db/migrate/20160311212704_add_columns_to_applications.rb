class AddColumnsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :legal_name, :string
    add_column :applications, :address, :string
    add_column :applications, :emergency_contact, :string
    add_column :applications, :scholarship_applicant, :boolean
    add_column :applications, :learn_about_scholarship, :text
    add_column :applications, :woman, :boolean
    add_column :applications, :minority, :boolean
    add_column :applications, :why_scholarship, :text
  end
end
