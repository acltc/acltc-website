class RenameDateColumnOnInfoSessionSignUps < ActiveRecord::Migration
  def change
    remove_column :info_session_sign_ups, :date, :datetime
    add_column :info_session_sign_ups, :info_session_id, :integer
  end

end
