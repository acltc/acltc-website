class AddNewFieldsToLakewoodApplication < ActiveRecord::Migration
  def change
    add_column :lakewood_applications, :currently_a_student, :string
    add_column :lakewood_applications, :student_part_or_full_time, :string
    add_column :lakewood_applications, :institution_name, :string
    add_column :lakewood_applications, :institution_city, :string
    add_column :lakewood_applications, :institution_state, :string
    add_column :lakewood_applications, :institution_zip, :string
    add_column :lakewood_applications, :student_concurrently, :text

    add_column :lakewood_applications, :currently_employed, :string
    add_column :lakewood_applications, :employed_part_or_full_time, :string
    add_column :lakewood_applications, :employer_name, :string
    add_column :lakewood_applications, :employer_city, :string
    add_column :lakewood_applications, :employer_state, :string
    add_column :lakewood_applications, :employer_zip, :string
    add_column :lakewood_applications, :employed_concurrently, :text
  end
end
