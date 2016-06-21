class AddMoreColumnsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :dreams_and_goals, :text
    add_column :applications, :how_will_you_achieve_goals, :text
    add_column :applications, :target_date, :string
    add_column :applications, :why_are_you_the_perfect_candidate, :text
  end
end
