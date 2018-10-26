class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
    	t.string :full_name
    	t.string :email
      t.text :dreams_and_goals
      t.text :change_your_life
      t.text :perfect_candidate

      t.timestamps null: false
    end
  end
end
