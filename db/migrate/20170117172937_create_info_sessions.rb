class CreateInfoSessions < ActiveRecord::Migration
  def change
    create_table :info_sessions do |t|
      t.datetime :date

      t.timestamps null: false
    end
  end
end
