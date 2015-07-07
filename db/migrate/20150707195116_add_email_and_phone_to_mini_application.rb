class AddEmailAndPhoneToMiniApplication < ActiveRecord::Migration
  def change
    add_column :mini_course_applications, :email, :string
    add_column :mini_course_applications, :phone, :string
  end
end
