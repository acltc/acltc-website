class ChangeDateColumnOnInfoSessionSignUps < ActiveRecord::Migration
  def change
    rename_column :info_session_sign_ups, :datetime, :date
    change_column :info_session_sign_ups, :date, :datetime
  end
end
