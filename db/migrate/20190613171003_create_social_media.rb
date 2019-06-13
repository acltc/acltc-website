class CreateSocialMedia < ActiveRecord::Migration
  def change
    create_table :social_media do |t|
      t.datetime :previous_post_time
      t.timestamps null: false
    end
  end
end
