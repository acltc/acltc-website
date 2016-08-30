class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender
      t.string :age
      t.string :race
      t.integer :times_applied
      t.string :salary
      t.string :credit_score
      t.string :financial_network
      t.string :savings
      t.integer :experience_in_coding
      t.integer :readiness

      t.timestamps null: false
    end
  end
end
