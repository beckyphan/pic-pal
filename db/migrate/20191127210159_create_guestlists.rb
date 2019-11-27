class CreateGuestlists < ActiveRecord::Migration[6.0]
  def change
    create_table :guestlists do |t|
      t.belongs_to :attendee, null: false, foreign_key: true
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
