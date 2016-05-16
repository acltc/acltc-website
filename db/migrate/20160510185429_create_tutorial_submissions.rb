class CreateTutorialSubmissions < ActiveRecord::Migration
  def change
    create_table :tutorial_submissions do |t|
      t.string :lesson_title
      t.string :gist_url
      t.boolean :reviewed

      t.timestamps null: false
    end
  end
end
