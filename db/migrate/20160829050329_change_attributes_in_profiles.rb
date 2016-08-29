class ChangeAttributesInProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :experience_in_coding, :string
    change_column :profiles, :readiness, :string
    change_column :profiles, :times_applied, :string
  end
end
