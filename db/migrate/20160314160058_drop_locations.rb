class DropLocations < ActiveRecord::Migration
  def change
    drop_table :locations, force: :cascade
  end
end
