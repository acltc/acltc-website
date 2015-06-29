class CreateJoinTableContactLocation < ActiveRecord::Migration
  def change
    create_join_table :contacts, :locations do |t|
      # t.index [:contact_id, :location_id]
      # t.index [:location_id, :contact_id]
    end
  end
end
