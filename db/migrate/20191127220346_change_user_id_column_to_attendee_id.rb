class ChangeUserIdColumnToAttendeeId < ActiveRecord::Migration[6.0]
  def change
    rename_column :guestlists, :user_id, :attendee_id
  end
end
