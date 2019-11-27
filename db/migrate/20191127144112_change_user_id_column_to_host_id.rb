class ChangeUserIdColumnToHostId < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :user_id, :host_id
  end
end
