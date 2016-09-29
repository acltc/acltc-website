class CreateLakewoodProfiles < ActiveRecord::Migration
  def change
    create_table :lakewood_profiles do |t|
      t.string :gender
      t.string :age
      t.string :race
      t.string :times_applied
      t.string :salary
      t.string :credit_score
      t.string :financial_network
      t.string :savings
      t.string :experience_in_coding
      t.string :readiness
      t.integer :lakewood_application_id

      t.timestamps null: false
    end
    remove_column :profiles, :lakewood_application_id, :integer
  end
end
