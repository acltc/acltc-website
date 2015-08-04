class CreateJoinTableApplicationLocation < ActiveRecord::Migration
  def change
    create_join_table :applications, :locations do |t|
      # t.index [:application_id, :location_id]
      # t.index [:location_id, :application_id]
    end
  end
end
