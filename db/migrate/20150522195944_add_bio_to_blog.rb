class AddBioToBlog < ActiveRecord::Migration
  def change
    add_column :admins, :bio, :text
  end
end
