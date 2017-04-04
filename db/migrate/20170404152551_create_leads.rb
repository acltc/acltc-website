class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :phone
      t.string :email
      t.string :event

      t.timestamps null: false
    end
  end
end
