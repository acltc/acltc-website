class CreateCapstones < ActiveRecord::Migration
  def change
    create_table :capstones do |t|
      t.string :project_name
      t.string :student_name
      t.string :youtube_id

      t.timestamps null: false
    end
  end
end
