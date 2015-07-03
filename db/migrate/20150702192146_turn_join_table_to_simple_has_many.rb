class TurnJoinTableToSimpleHasMany < ActiveRecord::Migration
  def change
    drop_join_table :mini_courses, :locations
    add_column :mini_courses, :location_id, :integer
  end
end
